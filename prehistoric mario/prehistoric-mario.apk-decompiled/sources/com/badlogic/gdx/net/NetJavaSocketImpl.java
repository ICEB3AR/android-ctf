package com.badlogic.gdx.net;

import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

public class NetJavaSocketImpl implements Socket {
    private Socket socket;

    public NetJavaSocketImpl(Net.Protocol protocol, String str, int i, SocketHints socketHints) {
        try {
            this.socket = new Socket();
            applyHints(socketHints);
            InetSocketAddress inetSocketAddress = new InetSocketAddress(str, i);
            if (socketHints != null) {
                this.socket.connect(inetSocketAddress, socketHints.connectTimeout);
            } else {
                this.socket.connect(inetSocketAddress);
            }
        } catch (Exception e) {
            throw new GdxRuntimeException("Error making a socket connection to " + str + ":" + i, e);
        }
    }

    public NetJavaSocketImpl(Socket socket2, SocketHints socketHints) {
        this.socket = socket2;
        applyHints(socketHints);
    }

    private void applyHints(SocketHints socketHints) {
        if (socketHints != null) {
            try {
                this.socket.setPerformancePreferences(socketHints.performancePrefConnectionTime, socketHints.performancePrefLatency, socketHints.performancePrefBandwidth);
                this.socket.setTrafficClass(socketHints.trafficClass);
                this.socket.setTcpNoDelay(socketHints.tcpNoDelay);
                this.socket.setKeepAlive(socketHints.keepAlive);
                this.socket.setSendBufferSize(socketHints.sendBufferSize);
                this.socket.setReceiveBufferSize(socketHints.receiveBufferSize);
                this.socket.setSoLinger(socketHints.linger, socketHints.lingerDuration);
                this.socket.setSoTimeout(socketHints.socketTimeout);
            } catch (Exception e) {
                throw new GdxRuntimeException("Error setting socket hints.", e);
            }
        }
    }

    @Override // com.badlogic.gdx.net.Socket
    public boolean isConnected() {
        Socket socket2 = this.socket;
        if (socket2 != null) {
            return socket2.isConnected();
        }
        return false;
    }

    @Override // com.badlogic.gdx.net.Socket
    public InputStream getInputStream() {
        try {
            return this.socket.getInputStream();
        } catch (Exception e) {
            throw new GdxRuntimeException("Error getting input stream from socket.", e);
        }
    }

    @Override // com.badlogic.gdx.net.Socket
    public OutputStream getOutputStream() {
        try {
            return this.socket.getOutputStream();
        } catch (Exception e) {
            throw new GdxRuntimeException("Error getting output stream from socket.", e);
        }
    }

    @Override // com.badlogic.gdx.net.Socket
    public String getRemoteAddress() {
        return this.socket.getRemoteSocketAddress().toString();
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        Socket socket2 = this.socket;
        if (socket2 != null) {
            try {
                socket2.close();
                this.socket = null;
            } catch (Exception e) {
                throw new GdxRuntimeException("Error closing socket.", e);
            }
        }
    }
}
