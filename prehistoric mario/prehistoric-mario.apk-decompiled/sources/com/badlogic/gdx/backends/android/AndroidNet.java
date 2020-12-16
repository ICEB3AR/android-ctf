package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.net.NetJavaImpl;
import com.badlogic.gdx.net.NetJavaServerSocketImpl;
import com.badlogic.gdx.net.NetJavaSocketImpl;
import com.badlogic.gdx.net.ServerSocket;
import com.badlogic.gdx.net.ServerSocketHints;
import com.badlogic.gdx.net.Socket;
import com.badlogic.gdx.net.SocketHints;

public class AndroidNet implements Net {
    final AndroidApplicationBase app;
    NetJavaImpl netJavaImpl;

    public AndroidNet(AndroidApplicationBase androidApplicationBase, AndroidApplicationConfiguration androidApplicationConfiguration) {
        this.app = androidApplicationBase;
        this.netJavaImpl = new NetJavaImpl(androidApplicationConfiguration.maxNetThreads);
    }

    @Override // com.badlogic.gdx.Net
    public void sendHttpRequest(Net.HttpRequest httpRequest, Net.HttpResponseListener httpResponseListener) {
        this.netJavaImpl.sendHttpRequest(httpRequest, httpResponseListener);
    }

    @Override // com.badlogic.gdx.Net
    public void cancelHttpRequest(Net.HttpRequest httpRequest) {
        this.netJavaImpl.cancelHttpRequest(httpRequest);
    }

    @Override // com.badlogic.gdx.Net
    public ServerSocket newServerSocket(Net.Protocol protocol, String str, int i, ServerSocketHints serverSocketHints) {
        return new NetJavaServerSocketImpl(protocol, str, i, serverSocketHints);
    }

    @Override // com.badlogic.gdx.Net
    public ServerSocket newServerSocket(Net.Protocol protocol, int i, ServerSocketHints serverSocketHints) {
        return new NetJavaServerSocketImpl(protocol, i, serverSocketHints);
    }

    @Override // com.badlogic.gdx.Net
    public Socket newClientSocket(Net.Protocol protocol, String str, int i, SocketHints socketHints) {
        return new NetJavaSocketImpl(protocol, str, i, socketHints);
    }

    @Override // com.badlogic.gdx.Net
    public boolean openURI(String str) {
        final Uri parse = Uri.parse(str);
        if (this.app.getContext().getPackageManager().resolveActivity(new Intent("android.intent.action.VIEW", parse), 65536) == null) {
            return false;
        }
        this.app.runOnUiThread(new Runnable() {
            /* class com.badlogic.gdx.backends.android.AndroidNet.AnonymousClass1 */

            public void run() {
                Intent intent = new Intent("android.intent.action.VIEW", parse);
                if (!(AndroidNet.this.app.getContext() instanceof Activity)) {
                    intent.addFlags(268435456);
                }
                AndroidNet.this.app.startActivity(intent);
            }
        });
        return true;
    }
}
