package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;

public class NetJavaServerSocketImpl implements ServerSocket {
    private Net.Protocol protocol;
    private ServerSocket server;

    public NetJavaServerSocketImpl(Net.Protocol protocol2, int i, ServerSocketHints serverSocketHints) {
        this(protocol2, null, i, serverSocketHints);
    }

    public NetJavaServerSocketImpl(Net.Protocol protocol2, String str, int i, ServerSocketHints serverSocketHints) {
        InetSocketAddress inetSocketAddress;
        this.protocol = protocol2;
        try {
            this.server = new ServerSocket();
            if (serverSocketHints != null) {
                this.server.setPerformancePreferences(serverSocketHints.performancePrefConnectionTime, serverSocketHints.performancePrefLatency, serverSocketHints.performancePrefBandwidth);
                this.server.setReuseAddress(serverSocketHints.reuseAddress);
                this.server.setSoTimeout(serverSocketHints.acceptTimeout);
                this.server.setReceiveBufferSize(serverSocketHints.receiveBufferSize);
            }
            if (str != null) {
                inetSocketAddress = new InetSocketAddress(str, i);
            } else {
                inetSocketAddress = new InetSocketAddress(i);
            }
            if (serverSocketHints != null) {
                this.server.bind(inetSocketAddress, serverSocketHints.backlog);
            } else {
                this.server.bind(inetSocketAddress);
            }
        } catch (Exception e) {
            throw new GdxRuntimeException("Cannot create a server socket at port " + i + ".", e);
        }
    }

    @Override // com.badlogic.gdx.net.ServerSocket
    public Net.Protocol getProtocol() {
        return this.protocol;
    }

    @Override // com.badlogic.gdx.net.ServerSocket
    public Socket accept(SocketHints socketHints) {
        try {
            return new NetJavaSocketImpl(this.server.accept(), socketHints);
        } catch (Exception e) {
            throw new GdxRuntimeException("Error accepting socket.", e);
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        ServerSocket serverSocket = this.server;
        if (serverSocket != null) {
            try {
                serverSocket.close();
                this.server = null;
            } catch (Exception e) {
                throw new GdxRuntimeException("Error closing server.", e);
            }
        }
    }
}
