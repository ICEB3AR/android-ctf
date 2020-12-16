package com.badlogic.gdx.utils.async;

import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

public class AsyncExecutor implements Disposable {
    private final ExecutorService executor;

    public AsyncExecutor(int i) {
        this(i, "AsynchExecutor-Thread");
    }

    public AsyncExecutor(int i, final String str) {
        this.executor = Executors.newFixedThreadPool(i, new ThreadFactory() {
            /* class com.badlogic.gdx.utils.async.AsyncExecutor.AnonymousClass1 */

            public Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, str);
                thread.setDaemon(true);
                return thread;
            }
        });
    }

    public <T> AsyncResult<T> submit(final AsyncTask<T> asyncTask) {
        if (!this.executor.isShutdown()) {
            return new AsyncResult<>(this.executor.submit(new Callable<T>() {
                /* class com.badlogic.gdx.utils.async.AsyncExecutor.AnonymousClass2 */

                @Override // java.util.concurrent.Callable
                public T call() throws Exception {
                    return (T) asyncTask.call();
                }
            }));
        }
        throw new GdxRuntimeException("Cannot run tasks on an executor that has been shutdown (disposed)");
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.executor.shutdown();
        try {
            this.executor.awaitTermination(Long.MAX_VALUE, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            throw new GdxRuntimeException("Couldn't shutdown loading thread", e);
        }
    }
}
