import qbs
import Stm32Library
import qbs.FileInfo
import qbs.ModUtils

Stm32Library {
    name: "Libraries"
    condition: project.withMurenaCnc

    cpp.includePaths: [
        "../app",
        ".",
        "cmsis",
        "cmsis_boot",
        "cmsis_boot/startup",
        "stm_lib",
        "stm_lib/inc",
        "stm_lib/src",
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

    Group {
        name: "sources"
        prefix: "**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        excludeFiles: [
            
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu89" ]
    }

    Export {
        Depends { name: "cpp" }

        cpp.includePaths: [
            "../app",
            "../app/WS2812B"
	    "../app/WS2812B/stm32f10x-ws2812b-lib"
	    "../app/WS2812B/stm32f10x-ws2812b-lib/inc"
	    "../app/WS2812B/stm32f10x-ws2812b-lib/src"
            ".",
            "cmsis",
	    "cmsis_boot",
	    "cmsis_boot/startup",
	    "stm_lib",
	    "stm_lib/inc",
	    "stm_lib/src",
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
    }
}
