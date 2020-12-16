package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.ObjectMap;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;

public class I18NBundle {
    private static final String DEFAULT_ENCODING = "UTF-8";
    private static final Locale ROOT_LOCALE = new Locale(BuildConfig.FLAVOR, BuildConfig.FLAVOR, BuildConfig.FLAVOR);
    private static boolean exceptionOnMissingKey = true;
    private static boolean simpleFormatter = false;
    private TextFormatter formatter;
    private Locale locale;
    private I18NBundle parent;
    private ObjectMap<String, String> properties;

    public static boolean getSimpleFormatter() {
        return simpleFormatter;
    }

    public static void setSimpleFormatter(boolean z) {
        simpleFormatter = z;
    }

    public static boolean getExceptionOnMissingKey() {
        return exceptionOnMissingKey;
    }

    public static void setExceptionOnMissingKey(boolean z) {
        exceptionOnMissingKey = z;
    }

    public static I18NBundle createBundle(FileHandle fileHandle) {
        return createBundleImpl(fileHandle, Locale.getDefault(), DEFAULT_ENCODING);
    }

    public static I18NBundle createBundle(FileHandle fileHandle, Locale locale2) {
        return createBundleImpl(fileHandle, locale2, DEFAULT_ENCODING);
    }

    public static I18NBundle createBundle(FileHandle fileHandle, String str) {
        return createBundleImpl(fileHandle, Locale.getDefault(), str);
    }

    public static I18NBundle createBundle(FileHandle fileHandle, Locale locale2, String str) {
        return createBundleImpl(fileHandle, locale2, str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0082  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static com.badlogic.gdx.utils.I18NBundle createBundleImpl(com.badlogic.gdx.files.FileHandle r9, java.util.Locale r10, java.lang.String r11) {
        /*
        // Method dump skipped, instructions count: 140
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.I18NBundle.createBundleImpl(com.badlogic.gdx.files.FileHandle, java.util.Locale, java.lang.String):com.badlogic.gdx.utils.I18NBundle");
    }

    private static List<Locale> getCandidateLocales(Locale locale2) {
        String language = locale2.getLanguage();
        String country = locale2.getCountry();
        String variant = locale2.getVariant();
        ArrayList arrayList = new ArrayList(4);
        if (variant.length() > 0) {
            arrayList.add(locale2);
        }
        if (country.length() > 0) {
            arrayList.add(arrayList.isEmpty() ? locale2 : new Locale(language, country));
        }
        if (language.length() > 0) {
            if (!arrayList.isEmpty()) {
                locale2 = new Locale(language);
            }
            arrayList.add(locale2);
        }
        arrayList.add(ROOT_LOCALE);
        return arrayList;
    }

    private static Locale getFallbackLocale(Locale locale2) {
        Locale locale3 = Locale.getDefault();
        if (locale2.equals(locale3)) {
            return null;
        }
        return locale3;
    }

    private static I18NBundle loadBundleChain(FileHandle fileHandle, String str, List<Locale> list, int i, I18NBundle i18NBundle) {
        I18NBundle i18NBundle2;
        Locale locale2 = list.get(i);
        if (i != list.size() - 1) {
            i18NBundle2 = loadBundleChain(fileHandle, str, list, i + 1, i18NBundle);
        } else if (i18NBundle != null && locale2.equals(ROOT_LOCALE)) {
            return i18NBundle;
        } else {
            i18NBundle2 = null;
        }
        I18NBundle loadBundle = loadBundle(fileHandle, str, locale2);
        if (loadBundle == null) {
            return i18NBundle2;
        }
        loadBundle.parent = i18NBundle2;
        return loadBundle;
    }

    private static I18NBundle loadBundle(FileHandle fileHandle, String str, Locale locale2) {
        I18NBundle i18NBundle;
        Reader reader = null;
        try {
            FileHandle fileHandle2 = toFileHandle(fileHandle, locale2);
            if (checkFileExistence(fileHandle2)) {
                i18NBundle = new I18NBundle();
                reader = fileHandle2.reader(str);
                i18NBundle.load(reader);
            } else {
                i18NBundle = null;
            }
            StreamUtils.closeQuietly(reader);
            if (i18NBundle != null) {
                i18NBundle.setLocale(locale2);
            }
            return i18NBundle;
        } catch (IOException e) {
            throw new GdxRuntimeException(e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(null);
            throw th;
        }
    }

    private static boolean checkFileExistence(FileHandle fileHandle) {
        try {
            fileHandle.read().close();
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    /* access modifiers changed from: protected */
    public void load(Reader reader) throws IOException {
        this.properties = new ObjectMap<>();
        PropertiesUtils.load(this.properties, reader);
    }

    private static FileHandle toFileHandle(FileHandle fileHandle, Locale locale2) {
        StringBuilder stringBuilder = new StringBuilder(fileHandle.name());
        if (!locale2.equals(ROOT_LOCALE)) {
            String language = locale2.getLanguage();
            String country = locale2.getCountry();
            String variant = locale2.getVariant();
            boolean equals = BuildConfig.FLAVOR.equals(language);
            boolean equals2 = BuildConfig.FLAVOR.equals(country);
            boolean equals3 = BuildConfig.FLAVOR.equals(variant);
            if (!equals || !equals2 || !equals3) {
                stringBuilder.append('_');
                if (!equals3) {
                    stringBuilder.append(language).append('_').append(country).append('_').append(variant);
                } else if (!equals2) {
                    stringBuilder.append(language).append('_').append(country);
                } else {
                    stringBuilder.append(language);
                }
            }
        }
        return fileHandle.sibling(stringBuilder.append(".properties").toString());
    }

    public Locale getLocale() {
        return this.locale;
    }

    private void setLocale(Locale locale2) {
        this.locale = locale2;
        this.formatter = new TextFormatter(locale2, !simpleFormatter);
    }

    public final String get(String str) {
        String str2 = this.properties.get(str);
        if (str2 == null) {
            I18NBundle i18NBundle = this.parent;
            if (i18NBundle != null) {
                str2 = i18NBundle.get(str);
            }
            if (str2 == null) {
                if (!exceptionOnMissingKey) {
                    return "???" + str + "???";
                }
                throw new MissingResourceException("Can't find bundle key " + str, getClass().getName(), str);
            }
        }
        return str2;
    }

    public String format(String str, Object... objArr) {
        return this.formatter.format(get(str), objArr);
    }

    public void debug(String str) {
        ObjectMap.Keys<String> keys = this.properties.keys();
        if (keys != null) {
            ObjectMap.Keys<String> it = keys.iterator();
            while (it.hasNext()) {
                this.properties.put((String) it.next(), str);
            }
        }
    }
}
