package com.badlogic.gdx.net;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class NetJavaImpl {
    final ObjectMap<Net.HttpRequest, HttpURLConnection> connections;
    private final ExecutorService executorService;
    final ObjectMap<Net.HttpRequest, Net.HttpResponseListener> listeners;

    static class HttpClientResponse implements Net.HttpResponse {
        private final HttpURLConnection connection;
        private HttpStatus status;

        public HttpClientResponse(HttpURLConnection httpURLConnection) throws IOException {
            this.connection = httpURLConnection;
            try {
                this.status = new HttpStatus(httpURLConnection.getResponseCode());
            } catch (IOException unused) {
                this.status = new HttpStatus(-1);
            }
        }

        /* JADX WARNING: Code restructure failed: missing block: B:12:0x001e, code lost:
            return com.badlogic.gdx.utils.StreamUtils.EMPTY_BYTES;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x001f, code lost:
            com.badlogic.gdx.utils.StreamUtils.closeQuietly(r0);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:14:0x0022, code lost:
            throw r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0017, code lost:
            r1 = move-exception;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0019 */
        @Override // com.badlogic.gdx.Net.HttpResponse
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public byte[] getResult() {
            /*
                r2 = this;
                java.io.InputStream r0 = r2.getInputStream()
                if (r0 != 0) goto L_0x0009
                byte[] r0 = com.badlogic.gdx.utils.StreamUtils.EMPTY_BYTES
                return r0
            L_0x0009:
                java.net.HttpURLConnection r1 = r2.connection     // Catch:{ IOException -> 0x0019 }
                int r1 = r1.getContentLength()     // Catch:{ IOException -> 0x0019 }
                byte[] r1 = com.badlogic.gdx.utils.StreamUtils.copyStreamToByteArray(r0, r1)     // Catch:{ IOException -> 0x0019 }
                com.badlogic.gdx.utils.StreamUtils.closeQuietly(r0)
                return r1
            L_0x0017:
                r1 = move-exception
                goto L_0x001f
            L_0x0019:
                byte[] r1 = com.badlogic.gdx.utils.StreamUtils.EMPTY_BYTES     // Catch:{ all -> 0x0017 }
                com.badlogic.gdx.utils.StreamUtils.closeQuietly(r0)
                return r1
            L_0x001f:
                com.badlogic.gdx.utils.StreamUtils.closeQuietly(r0)
                throw r1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.net.NetJavaImpl.HttpClientResponse.getResult():byte[]");
        }

        @Override // com.badlogic.gdx.Net.HttpResponse
        public String getResultAsString() {
            InputStream inputStream = getInputStream();
            if (inputStream == null) {
                return BuildConfig.FLAVOR;
            }
            try {
                return StreamUtils.copyStreamToString(inputStream, this.connection.getContentLength(), "UTF8");
            } catch (IOException unused) {
                return BuildConfig.FLAVOR;
            } finally {
                StreamUtils.closeQuietly(inputStream);
            }
        }

        @Override // com.badlogic.gdx.Net.HttpResponse
        public InputStream getResultAsStream() {
            return getInputStream();
        }

        @Override // com.badlogic.gdx.Net.HttpResponse
        public HttpStatus getStatus() {
            return this.status;
        }

        @Override // com.badlogic.gdx.Net.HttpResponse
        public String getHeader(String str) {
            return this.connection.getHeaderField(str);
        }

        @Override // com.badlogic.gdx.Net.HttpResponse
        public Map<String, List<String>> getHeaders() {
            return this.connection.getHeaderFields();
        }

        private InputStream getInputStream() {
            try {
                return this.connection.getInputStream();
            } catch (IOException unused) {
                return this.connection.getErrorStream();
            }
        }
    }

    public NetJavaImpl() {
        this(Integer.MAX_VALUE);
    }

    public NetJavaImpl(int i) {
        this.executorService = new ThreadPoolExecutor(0, i, 60, TimeUnit.SECONDS, new SynchronousQueue(), new ThreadFactory() {
            /* class com.badlogic.gdx.net.NetJavaImpl.AnonymousClass1 */

            public Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, "NetThread");
                thread.setDaemon(true);
                return thread;
            }
        });
        this.connections = new ObjectMap<>();
        this.listeners = new ObjectMap<>();
    }

    public void sendHttpRequest(final Net.HttpRequest httpRequest, final Net.HttpResponseListener httpResponseListener) {
        URL url;
        if (httpRequest.getUrl() == null) {
            httpResponseListener.failed(new GdxRuntimeException("can't process a HTTP request without URL set"));
            return;
        }
        try {
            String method = httpRequest.getMethod();
            if (method.equalsIgnoreCase(Net.HttpMethods.GET)) {
                String content = httpRequest.getContent();
                String str = BuildConfig.FLAVOR;
                if (content != null && !str.equals(content)) {
                    str = "?" + content;
                }
                url = new URL(httpRequest.getUrl() + str);
            } else {
                url = new URL(httpRequest.getUrl());
            }
            final HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            final boolean z = method.equalsIgnoreCase(Net.HttpMethods.POST) || method.equalsIgnoreCase(Net.HttpMethods.PUT) || method.equalsIgnoreCase(Net.HttpMethods.PATCH);
            httpURLConnection.setDoOutput(z);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setRequestMethod(method);
            HttpURLConnection.setFollowRedirects(httpRequest.getFollowRedirects());
            putIntoConnectionsAndListeners(httpRequest, httpResponseListener, httpURLConnection);
            for (Map.Entry<String, String> entry : httpRequest.getHeaders().entrySet()) {
                httpURLConnection.addRequestProperty(entry.getKey(), entry.getValue());
            }
            httpURLConnection.setConnectTimeout(httpRequest.getTimeOut());
            httpURLConnection.setReadTimeout(httpRequest.getTimeOut());
            this.executorService.submit(new Runnable() {
                /* class com.badlogic.gdx.net.NetJavaImpl.AnonymousClass2 */

                public void run() {
                    try {
                        if (z) {
                            String content = httpRequest.getContent();
                            if (content != null) {
                                OutputStreamWriter outputStreamWriter = new OutputStreamWriter(httpURLConnection.getOutputStream(), "UTF8");
                                try {
                                    outputStreamWriter.write(content);
                                } finally {
                                    StreamUtils.closeQuietly(outputStreamWriter);
                                }
                            } else {
                                InputStream contentStream = httpRequest.getContentStream();
                                if (contentStream != null) {
                                    OutputStream outputStream = httpURLConnection.getOutputStream();
                                    try {
                                        StreamUtils.copyStream(contentStream, outputStream);
                                    } finally {
                                        StreamUtils.closeQuietly(outputStream);
                                    }
                                }
                            }
                        }
                        httpURLConnection.connect();
                        HttpClientResponse httpClientResponse = new HttpClientResponse(httpURLConnection);
                        try {
                            Net.HttpResponseListener fromListeners = NetJavaImpl.this.getFromListeners(httpRequest);
                            if (fromListeners != null) {
                                fromListeners.handleHttpResponse(httpClientResponse);
                            }
                        } finally {
                            httpURLConnection.disconnect();
                        }
                    } catch (Exception e) {
                        httpURLConnection.disconnect();
                        httpResponseListener.failed(e);
                    } finally {
                        NetJavaImpl.this.removeFromConnectionsAndListeners(httpRequest);
                    }
                }
            });
        } catch (Exception e) {
            httpResponseListener.failed(e);
            removeFromConnectionsAndListeners(httpRequest);
        } catch (Throwable th) {
            removeFromConnectionsAndListeners(httpRequest);
            throw th;
        }
    }

    public void cancelHttpRequest(Net.HttpRequest httpRequest) {
        Net.HttpResponseListener fromListeners = getFromListeners(httpRequest);
        if (fromListeners != null) {
            fromListeners.cancelled();
            removeFromConnectionsAndListeners(httpRequest);
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized void removeFromConnectionsAndListeners(Net.HttpRequest httpRequest) {
        this.connections.remove(httpRequest);
        this.listeners.remove(httpRequest);
    }

    /* access modifiers changed from: package-private */
    public synchronized void putIntoConnectionsAndListeners(Net.HttpRequest httpRequest, Net.HttpResponseListener httpResponseListener, HttpURLConnection httpURLConnection) {
        this.connections.put(httpRequest, httpURLConnection);
        this.listeners.put(httpRequest, httpResponseListener);
    }

    /* access modifiers changed from: package-private */
    public synchronized Net.HttpResponseListener getFromListeners(Net.HttpRequest httpRequest) {
        return this.listeners.get(httpRequest);
    }
}
