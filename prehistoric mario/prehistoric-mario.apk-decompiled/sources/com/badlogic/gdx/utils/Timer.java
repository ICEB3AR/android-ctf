package com.badlogic.gdx.utils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.LifecycleListener;

public class Timer {
    static TimerThread thread;
    static final Object threadLock = new Object();
    final Array<Task> tasks = new Array<>(false, 8);

    public static Timer instance() {
        Timer timer;
        synchronized (threadLock) {
            TimerThread thread2 = thread();
            if (thread2.instance == null) {
                thread2.instance = new Timer();
            }
            timer = thread2.instance;
        }
        return timer;
    }

    private static TimerThread thread() {
        TimerThread timerThread;
        synchronized (threadLock) {
            if (thread == null || thread.files != Gdx.files) {
                if (thread != null) {
                    thread.dispose();
                }
                thread = new TimerThread();
            }
            timerThread = thread;
        }
        return timerThread;
    }

    public Timer() {
        start();
    }

    public Task postTask(Task task) {
        return scheduleTask(task, 0.0f, 0.0f, 0);
    }

    public Task scheduleTask(Task task, float f) {
        return scheduleTask(task, f, 0.0f, 0);
    }

    public Task scheduleTask(Task task, float f, float f2) {
        return scheduleTask(task, f, f2, -1);
    }

    public Task scheduleTask(Task task, float f, float f2, int i) {
        synchronized (this) {
            synchronized (task) {
                if (task.timer == null) {
                    task.timer = this;
                    task.executeTimeMillis = (System.nanoTime() / 1000000) + ((long) (f * 1000.0f));
                    task.intervalMillis = (long) (f2 * 1000.0f);
                    task.repeatCount = i;
                    this.tasks.add(task);
                } else {
                    throw new IllegalArgumentException("The same task may not be scheduled twice.");
                }
            }
        }
        synchronized (threadLock) {
            threadLock.notifyAll();
        }
        return task;
    }

    public void stop() {
        synchronized (threadLock) {
            thread().instances.removeValue(this, true);
        }
    }

    public void start() {
        synchronized (threadLock) {
            Array<Timer> array = thread().instances;
            if (!array.contains(this, true)) {
                array.add(this);
                threadLock.notifyAll();
            }
        }
    }

    public synchronized void clear() {
        int i = this.tasks.size;
        for (int i2 = 0; i2 < i; i2++) {
            Task task = this.tasks.get(i2);
            synchronized (task) {
                task.executeTimeMillis = 0;
                task.timer = null;
            }
        }
        this.tasks.clear();
    }

    public synchronized boolean isEmpty() {
        return this.tasks.size == 0;
    }

    /* access modifiers changed from: package-private */
    public synchronized long update(long j, long j2) {
        int i = 0;
        int i2 = this.tasks.size;
        while (i < i2) {
            Task task = this.tasks.get(i);
            synchronized (task) {
                if (task.executeTimeMillis > j) {
                    j2 = Math.min(j2, task.executeTimeMillis - j);
                } else {
                    if (task.repeatCount == 0) {
                        task.timer = null;
                        this.tasks.removeIndex(i);
                        i--;
                        i2--;
                    } else {
                        task.executeTimeMillis = task.intervalMillis + j;
                        j2 = Math.min(j2, task.intervalMillis);
                        if (task.repeatCount > 0) {
                            task.repeatCount--;
                        }
                    }
                    task.app.postRunnable(task);
                }
            }
            i++;
        }
        return j2;
    }

    public synchronized void delay(long j) {
        int i = this.tasks.size;
        for (int i2 = 0; i2 < i; i2++) {
            Task task = this.tasks.get(i2);
            synchronized (task) {
                task.executeTimeMillis += j;
            }
        }
    }

    public static Task post(Task task) {
        return instance().postTask(task);
    }

    public static Task schedule(Task task, float f) {
        return instance().scheduleTask(task, f);
    }

    public static Task schedule(Task task, float f, float f2) {
        return instance().scheduleTask(task, f, f2);
    }

    public static Task schedule(Task task, float f, float f2, int i) {
        return instance().scheduleTask(task, f, f2, i);
    }

    public static abstract class Task implements Runnable {
        final Application app = Gdx.app;
        long executeTimeMillis;
        long intervalMillis;
        int repeatCount;
        volatile Timer timer;

        public abstract void run();

        public Task() {
            if (this.app == null) {
                throw new IllegalStateException("Gdx.app not available.");
            }
        }

        public void cancel() {
            Timer timer2 = this.timer;
            if (timer2 != null) {
                synchronized (timer2) {
                    synchronized (this) {
                        this.executeTimeMillis = 0;
                        this.timer = null;
                        timer2.tasks.removeValue(this, true);
                    }
                }
                return;
            }
            synchronized (this) {
                this.executeTimeMillis = 0;
                this.timer = null;
            }
        }

        public boolean isScheduled() {
            return this.timer != null;
        }

        public synchronized long getExecuteTimeMillis() {
            return this.executeTimeMillis;
        }
    }

    /* access modifiers changed from: package-private */
    public static class TimerThread implements Runnable, LifecycleListener {
        final Files files = Gdx.files;
        Timer instance;
        final Array<Timer> instances = new Array<>(1);
        private long pauseMillis;

        public TimerThread() {
            Gdx.app.addLifecycleListener(this);
            resume();
            Thread thread = new Thread(this, "Timer");
            thread.setDaemon(true);
            thread.start();
        }

        public void run() {
            while (true) {
                synchronized (Timer.threadLock) {
                    if (Timer.thread != this) {
                        break;
                    } else if (this.files != Gdx.files) {
                        break;
                    } else {
                        long j = 5000;
                        if (this.pauseMillis == 0) {
                            long nanoTime = System.nanoTime() / 1000000;
                            int i = this.instances.size;
                            for (int i2 = 0; i2 < i; i2++) {
                                try {
                                    j = this.instances.get(i2).update(nanoTime, j);
                                } catch (Throwable th) {
                                    throw new GdxRuntimeException("Task failed: " + this.instances.get(i2).getClass().getName(), th);
                                }
                            }
                        }
                        if (Timer.thread == this && this.files == Gdx.files) {
                            if (j > 0) {
                                try {
                                    Timer.threadLock.wait(j);
                                } catch (InterruptedException unused) {
                                }
                            }
                        }
                    }
                }
            }
            dispose();
        }

        @Override // com.badlogic.gdx.LifecycleListener
        public void resume() {
            synchronized (Timer.threadLock) {
                long nanoTime = (System.nanoTime() / 1000000) - this.pauseMillis;
                int i = this.instances.size;
                for (int i2 = 0; i2 < i; i2++) {
                    this.instances.get(i2).delay(nanoTime);
                }
                this.pauseMillis = 0;
                Timer.threadLock.notifyAll();
            }
        }

        @Override // com.badlogic.gdx.LifecycleListener
        public void pause() {
            synchronized (Timer.threadLock) {
                this.pauseMillis = System.nanoTime() / 1000000;
                Timer.threadLock.notifyAll();
            }
        }

        @Override // com.badlogic.gdx.LifecycleListener
        public void dispose() {
            synchronized (Timer.threadLock) {
                if (Timer.thread == this) {
                    Timer.thread = null;
                }
                this.instances.clear();
                Timer.threadLock.notifyAll();
            }
            Gdx.app.removeLifecycleListener(this);
        }
    }
}
