add_rules("mode.debug","mode.release")
add_requires("libsdl =2.0.8")
add_requires("pybind11 >=2.10.0")
includes("../extensions/xmake.lua")

target("flex-demo")
    add_rules("plugin.vsxmake.autoupdate")
    if is_plat("windows") then
        add_defines("WIN64")
    else
        add_defines("PLATFORM_LINUX")
    end

    set_kind("binary")
    add_includedirs(".",{public=true})
    add_headerfiles("(./*.h)")
    add_includedirs("scenes",{public=true})
    add_headerfiles("(scenes/*.h)")
    add_includedirs("opengl",{public=true})
    add_headerfiles("(opengl/*.h)")

    add_includedirs("../core",{public=true})
    add_headerfiles("(../core/*.h)")

    add_files("*.cpp","*.cu","*.cxx","*.cc")
    add_files("../core/*.cpp")
    add_files("opengl/*.cpp")

    if is_plat("windows") then
        add_includedirs("../external/GFSDK_Aftermath_v1.21/include",{public=true})
        add_headerfiles("(../external/GFSDK_Aftermath_v1.21/include/*.h)")
        add_links("GFSDK_Aftermath_Lib.x64","GFSDK_Aftermath_Lib_UWP.x64")
        add_linkdirs("../external/GFSDK_Aftermath_v1.21/lib/x64")
    end

    add_deps("flex-ext")

    add_includedirs("../include",{public=true})
    add_headerfiles("(../include/*.h)")
    add_linkdirs("../lib/win64","../lib/linux64")
    if is_mode("release") then
        add_links("NvFlexReleaseCUDA_x64","NvFlexDeviceRelease_x64")
    else
        add_links("NvFlexDebugCUDA_x64","NvFlexDeviceDebug_x64")
    end
    

    add_cugencodes("native","compute_61")
    add_cuflags("-extended-lambda","-rdc=true")
    add_cuflags("-Xcompiler /bigobj")
    --add_ldflags("/subsystem:console")
    add_packages("libsdl",{public=true})
    add_packages("pybind11",{public=true})
    
