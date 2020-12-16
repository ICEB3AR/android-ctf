package com.uwsoft.editor.renderer.utils;

import com.alles.platformer.BuildConfig;
import java.util.HashMap;
import java.util.Map;

public class CustomVariables {
    private HashMap<String, String> variables = new HashMap<>();

    public void loadFromString(String str) {
        String[] split;
        this.variables.clear();
        for (String str2 : str.split(";")) {
            String[] split2 = str2.split(":");
            if (split2.length > 1) {
                setVariable(split2[0], split2[1]);
            }
        }
    }

    public String saveAsString() {
        String str = BuildConfig.FLAVOR;
        for (Map.Entry<String, String> entry : this.variables.entrySet()) {
            str = str + entry.getKey() + ":" + entry.getValue() + ";";
        }
        return str.length() > 0 ? str.substring(0, str.length() - 1) : str;
    }

    public void setVariable(String str, String str2) {
        this.variables.put(str, str2);
    }

    public void removeVariable(String str) {
        this.variables.remove(str);
    }

    public String getStringVariable(String str) {
        return this.variables.get(str);
    }

    public Integer getIntegerVariable(String str) {
        try {
            return Integer.valueOf(Integer.parseInt(this.variables.get(str)));
        } catch (Exception unused) {
            return null;
        }
    }

    public Float getFloatVariable(String str) {
        try {
            return Float.valueOf(Float.parseFloat(this.variables.get(str)));
        } catch (Exception unused) {
            return null;
        }
    }

    public HashMap<String, String> getHashMap() {
        return this.variables;
    }

    public int getCount() {
        return this.variables.size();
    }
}
