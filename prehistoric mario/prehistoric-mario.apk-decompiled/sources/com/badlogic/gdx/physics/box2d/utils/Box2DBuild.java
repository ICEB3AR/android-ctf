package com.badlogic.gdx.physics.box2d.utils;

import com.badlogic.gdx.jnigen.AntScriptGenerator;
import com.badlogic.gdx.jnigen.BuildConfig;
import com.badlogic.gdx.jnigen.BuildTarget;
import com.badlogic.gdx.jnigen.NativeCodeGenerator;
import java.io.File;

public class Box2DBuild {
    public static void main(String[] strArr) throws Exception {
        BuildTarget newDefaultTarget = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
        BuildTarget newDefaultTarget2 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, true);
        BuildTarget newDefaultTarget3 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, false);
        BuildTarget newDefaultTarget4 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, true);
        BuildTarget newDefaultTarget5 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Android, false);
        BuildTarget newDefaultTarget6 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.MacOsX, true);
        BuildTarget newDefaultTarget7 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.IOS, false);
        NativeCodeGenerator nativeCodeGenerator = new NativeCodeGenerator();
        nativeCodeGenerator.generate("src", "bin" + File.pathSeparator + "../../../gdx/bin", "jni");
        new AntScriptGenerator().generate(new BuildConfig("gdx-box2d"), new BuildTarget[]{newDefaultTarget, newDefaultTarget2, newDefaultTarget3, newDefaultTarget4, newDefaultTarget6, newDefaultTarget5, newDefaultTarget7});
    }
}
