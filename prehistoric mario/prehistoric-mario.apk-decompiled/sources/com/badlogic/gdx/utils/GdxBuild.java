package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.jnigen.AntScriptGenerator;
import com.badlogic.gdx.jnigen.BuildTarget;
import com.badlogic.gdx.jnigen.NativeCodeGenerator;

public class GdxBuild {
    public static void main(String[] strArr) throws Exception {
        new NativeCodeGenerator().generate("src", "bin", "jni", new String[]{"**/*"}, (String[]) null);
        String[] strArr2 = {"iosgl/**"};
        BuildTarget newDefaultTarget = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
        newDefaultTarget.compilerPrefix = BuildConfig.FLAVOR;
        newDefaultTarget.buildFileName = "build-windows32home.xml";
        newDefaultTarget.excludeFromMasterBuildFile = true;
        newDefaultTarget.cppExcludes = strArr2;
        BuildTarget newDefaultTarget2 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
        newDefaultTarget2.cppExcludes = strArr2;
        BuildTarget newDefaultTarget3 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, true);
        newDefaultTarget3.cppExcludes = strArr2;
        BuildTarget newDefaultTarget4 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, false);
        newDefaultTarget4.cppExcludes = strArr2;
        BuildTarget newDefaultTarget5 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, true);
        newDefaultTarget5.cppExcludes = strArr2;
        BuildTarget newDefaultTarget6 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Android, false);
        newDefaultTarget6.linkerFlags += " -llog";
        newDefaultTarget6.cppExcludes = strArr2;
        BuildTarget newDefaultTarget7 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.MacOsX, true);
        newDefaultTarget7.cppExcludes = strArr2;
        BuildTarget newDefaultTarget8 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.IOS, false);
        newDefaultTarget8.headerDirs = new String[]{"iosgl"};
        new AntScriptGenerator().generate(new com.badlogic.gdx.jnigen.BuildConfig("gdx", "../target/native", "libs", "jni"), new BuildTarget[]{newDefaultTarget7, newDefaultTarget, newDefaultTarget2, newDefaultTarget3, newDefaultTarget4, newDefaultTarget5, newDefaultTarget6, newDefaultTarget8});
    }
}
