package com.badlogic.gdx;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.net.HttpStatus;
import com.badlogic.gdx.net.ServerSocket;
import com.badlogic.gdx.net.ServerSocketHints;
import com.badlogic.gdx.net.Socket;
import com.badlogic.gdx.net.SocketHints;
import com.badlogic.gdx.utils.Pool;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface Net {

    public interface HttpMethods {
        public static final String DELETE = "DELETE";
        public static final String GET = "GET";
        public static final String PATCH = "PATCH";
        public static final String POST = "POST";
        public static final String PUT = "PUT";
    }

    public interface HttpResponse {
        String getHeader(String str);

        Map<String, List<String>> getHeaders();

        byte[] getResult();

        InputStream getResultAsStream();

        String getResultAsString();

        HttpStatus getStatus();
    }

    public interface HttpResponseListener {
        void cancelled();

        void failed(Throwable th);

        void handleHttpResponse(HttpResponse httpResponse);
    }

    public enum Protocol {
        TCP
    }

    void cancelHttpRequest(HttpRequest httpRequest);

    Socket newClientSocket(Protocol protocol, String str, int i, SocketHints socketHints);

    ServerSocket newServerSocket(Protocol protocol, int i, ServerSocketHints serverSocketHints);

    ServerSocket newServerSocket(Protocol protocol, String str, int i, ServerSocketHints serverSocketHints);

    boolean openURI(String str);

    void sendHttpRequest(HttpRequest httpRequest, HttpResponseListener httpResponseListener);

    public static class HttpRequest implements Pool.Poolable {
        private String content;
        private long contentLength;
        private InputStream contentStream;
        private boolean followRedirects;
        private Map<String, String> headers;
        private String httpMethod;
        private boolean includeCredentials;
        private int timeOut;
        private String url;

        public HttpRequest() {
            this.timeOut = 0;
            this.followRedirects = true;
            this.includeCredentials = false;
            this.headers = new HashMap();
        }

        public HttpRequest(String str) {
            this();
            this.httpMethod = str;
        }

        public void setUrl(String str) {
            this.url = str;
        }

        public void setHeader(String str, String str2) {
            this.headers.put(str, str2);
        }

        public void setContent(String str) {
            this.content = str;
        }

        public void setContent(InputStream inputStream, long j) {
            this.contentStream = inputStream;
            this.contentLength = j;
        }

        public void setTimeOut(int i) {
            this.timeOut = i;
        }

        public void setFollowRedirects(boolean z) throws IllegalArgumentException {
            if (z || Gdx.app.getType() != Application.ApplicationType.WebGL) {
                this.followRedirects = z;
                return;
            }
            throw new IllegalArgumentException("Following redirects can't be disabled using the GWT/WebGL backend!");
        }

        public void setIncludeCredentials(boolean z) {
            this.includeCredentials = z;
        }

        public void setMethod(String str) {
            this.httpMethod = str;
        }

        public int getTimeOut() {
            return this.timeOut;
        }

        public String getMethod() {
            return this.httpMethod;
        }

        public String getUrl() {
            return this.url;
        }

        public String getContent() {
            return this.content;
        }

        public InputStream getContentStream() {
            return this.contentStream;
        }

        public long getContentLength() {
            return this.contentLength;
        }

        public Map<String, String> getHeaders() {
            return this.headers;
        }

        public boolean getFollowRedirects() {
            return this.followRedirects;
        }

        public boolean getIncludeCredentials() {
            return this.includeCredentials;
        }

        @Override // com.badlogic.gdx.utils.Pool.Poolable
        public void reset() {
            this.httpMethod = null;
            this.url = null;
            this.headers.clear();
            this.timeOut = 0;
            this.content = null;
            this.contentStream = null;
            this.contentLength = 0;
            this.followRedirects = true;
        }
    }
}
