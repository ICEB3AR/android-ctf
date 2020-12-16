package com.badlogic.gdx.graphics.g2d.freetype;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.jnigen.AntScriptGenerator;
import com.badlogic.gdx.jnigen.BuildTarget;
import com.badlogic.gdx.jnigen.NativeCodeGenerator;

public class FreetypeBuild {
    public static void main(String[] strArr) throws Exception {
        String[] strArr2 = {"freetype-2.5.5/include"};
        String[] strArr3 = {"freetype-2.5.5/src/base/ftsystem.c", "freetype-2.5.5/src/base/ftinit.c", "freetype-2.5.5/src/base/ftdebug.c", "freetype-2.5.5/src/base/ftbase.c", "freetype-2.5.5/src/base/ftbbox.c", "freetype-2.5.5/src/base/ftglyph.c", "freetype-2.5.5/src/base/ftbdf.c", "freetype-2.5.5/src/base/ftbitmap.c", "freetype-2.5.5/src/base/ftcid.c", "freetype-2.5.5/src/base/ftfstype.c", "freetype-2.5.5/src/base/ftgasp.c", "freetype-2.5.5/src/base/ftgxval.c", "freetype-2.5.5/src/base/ftlcdfil.c", "freetype-2.5.5/src/base/ftmm.c", "freetype-2.5.5/src/base/ftotval.c", "freetype-2.5.5/src/base/ftpatent.c", "freetype-2.5.5/src/base/ftpfr.c", "freetype-2.5.5/src/base/ftstroke.c", "freetype-2.5.5/src/base/ftsynth.c", "freetype-2.5.5/src/base/fttype1.c", "freetype-2.5.5/src/base/ftwinfnt.c", "freetype-2.5.5/src/base/ftxf86.c", "freetype-2.5.5/src/bdf/bdf.c", "freetype-2.5.5/src/cff/cff.c", "freetype-2.5.5/src/cid/type1cid.c", "freetype-2.5.5/src/pcf/pcf.c", "freetype-2.5.5/src/pfr/pfr.c", "freetype-2.5.5/src/sfnt/sfnt.c", "freetype-2.5.5/src/truetype/truetype.c", "freetype-2.5.5/src/type1/type1.c", "freetype-2.5.5/src/type42/type42.c", "freetype-2.5.5/src/winfonts/winfnt.c", "freetype-2.5.5/src/raster/raster.c", "freetype-2.5.5/src/smooth/smooth.c", "freetype-2.5.5/src/autofit/autofit.c", "freetype-2.5.5/src/cache/ftcache.c", "freetype-2.5.5/src/gzip/ftgzip.c", "freetype-2.5.5/src/lzw/ftlzw.c", "freetype-2.5.5/src/bzip2/ftbzip2.c", "freetype-2.5.5/src/gxvalid/gxvalid.c", "freetype-2.5.5/src/otvalid/otvalid.c", "freetype-2.5.5/src/psaux/psaux.c", "freetype-2.5.5/src/pshinter/pshinter.c", "freetype-2.5.5/src/psnames/psnames.c"};
        BuildTarget newDefaultTarget = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
        newDefaultTarget.compilerPrefix = BuildConfig.FLAVOR;
        newDefaultTarget.buildFileName = "build-windows32home.xml";
        newDefaultTarget.excludeFromMasterBuildFile = true;
        newDefaultTarget.headerDirs = strArr2;
        newDefaultTarget.cIncludes = strArr3;
        newDefaultTarget.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget2 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
        newDefaultTarget2.headerDirs = strArr2;
        newDefaultTarget2.cIncludes = strArr3;
        newDefaultTarget2.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget2.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget3 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, true);
        newDefaultTarget3.headerDirs = strArr2;
        newDefaultTarget3.cIncludes = strArr3;
        newDefaultTarget3.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget3.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget4 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, false);
        newDefaultTarget4.headerDirs = strArr2;
        newDefaultTarget4.cIncludes = strArr3;
        newDefaultTarget4.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget4.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget5 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, true);
        newDefaultTarget5.headerDirs = strArr2;
        newDefaultTarget5.cIncludes = strArr3;
        newDefaultTarget5.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget5.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget6 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.MacOsX, false);
        newDefaultTarget6.headerDirs = strArr2;
        newDefaultTarget6.cIncludes = strArr3;
        newDefaultTarget6.cFlags += " -DFT2_BUILD_LIBRARY";
        newDefaultTarget6.cppFlags += " -DFT2_BUILD_LIBRARY";
        newDefaultTarget6.linkerFlags += " -framework CoreServices -framework Carbon";
        BuildTarget newDefaultTarget7 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.MacOsX, true);
        newDefaultTarget7.headerDirs = strArr2;
        newDefaultTarget7.cIncludes = strArr3;
        newDefaultTarget7.cFlags += " -DFT2_BUILD_LIBRARY";
        newDefaultTarget7.cppFlags += " -DFT2_BUILD_LIBRARY";
        newDefaultTarget7.linkerFlags += " -framework CoreServices -framework Carbon";
        BuildTarget newDefaultTarget8 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Android, false);
        newDefaultTarget8.headerDirs = strArr2;
        newDefaultTarget8.cIncludes = strArr3;
        newDefaultTarget8.cFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        newDefaultTarget8.cppFlags += " -std=c99 -DFT2_BUILD_LIBRARY";
        BuildTarget newDefaultTarget9 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.IOS, false);
        newDefaultTarget9.headerDirs = strArr2;
        newDefaultTarget9.cIncludes = strArr3;
        newDefaultTarget9.cFlags += " -DFT2_BUILD_LIBRARY";
        newDefaultTarget9.cppFlags += " -DFT2_BUILD_LIBRARY";
        new NativeCodeGenerator().generate();
        new AntScriptGenerator().generate(new com.badlogic.gdx.jnigen.BuildConfig("gdx-freetype"), new BuildTarget[]{newDefaultTarget, newDefaultTarget2, newDefaultTarget3, newDefaultTarget4, newDefaultTarget5, newDefaultTarget6, newDefaultTarget7, newDefaultTarget8, newDefaultTarget9});
    }
}
