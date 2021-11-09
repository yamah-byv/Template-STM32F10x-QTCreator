import qbs
import Stm32Application
import qbs.FileInfo
import qbs.ModUtils

Stm32Application {
    name: "Application"

    cpp.includePaths: [
        "app",
        "libs",
        "libs/cmsis",
        "libs/cmsis_boot",
        "libs/cmsis_boot/startup",
        "libs/stm_lib",
        "libs/stm_lib/inc",
        "libs/stm_lib/src",
    ]
    cpp.defines: [
        "STM32F10X",
        "USE_STDPERIPH_DRIVER",
        "HSE_VALUE=72000000",
    ]
    Properties {
        condition: cpp.debugInformation
        cpp.defines: outer.concat("DEBUG")
    }

    cpp.linkerScripts: [
        "../ldscripts/libs.ld",
        "../ldscripts/mem.ld",
        "../ldscripts/sections.ld",
    ]

    Group {
        name: "sources"
        prefix: "../**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        excludeFiles: [
            "ipv6/*.*",
            "test/unit/**/*.*",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
        cpp.warningLevel: "all"
    }
    Group {
        name: "ldscripts"
        prefix: "../ldscripts/"
        files: "*.ld"
    }
}
