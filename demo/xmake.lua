add_rules("mode.debug","mode.release")

add_requires("libsdl =2.0.8")

target("flex-demo")
    add_rules("plugin.vsxmake.autoupdate")
    add_cxxflags("-std=c++0x","-fPIC","-ffast-math")
    add_ldflags("-m64","-lm","-ffast-math")
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

    --add_includedirs("d3d",{public=true})
    --add_includedirs("d3d/shaders",{public=true})
    --add_headerfiles("(d3d/*.h)")
    --add_headerfiles("d3d/shaders/*.h")
    --add_files("d3d/*.cpp")

    --add_includedirs("d3d11",{public=true})
    --add_includedirs("d3d11/shaders",{public=true})
    --add_headerfiles("(d3d11/*.h)")
    --add_headerfiles("(d3d11/shaders/*.h)")
    --add_files("d3d11/*.cpp")

    --add_includedirs("d3d12",{public=true})
    --add_headerfiles("(d3d12/*.h)")
    --add_files("d3d12/*.cpp")

    --add_includedirs("../external/SDL2-2.0.4/include",{public=true})
    --add_headerfiles("(../external/SDL2-2.0.4/include/*.h)")
    --add_linkdirs("../external/SDL2-2.0.4/lib/x64")
    --add_links("SDL2","SDL2main")

    if is_plat("windows") then
        add_includedirs("../external/GFSDK_Aftermath_v1.21/include",{public=true})
        add_headerfiles("(../external/GFSDK_Aftermath_v1.21/include/*.h)")
        add_links("GFSDK_Aftermath_Lib.x64","GFSDK_Aftermath_Lib_UWP.x64")
        add_linkdirs("../external/GFSDK_Aftermath_v1.21/lib/x64")
    end


    add_includedirs("../include",{public=true})
    add_headerfiles("(../include/*.h)")
    --add_includedirs("../lib/win64",{public=true})
    add_linkdirs("../lib/win64","../lib/linux64")
    --add_links("NvFlexReleaseCUDA_x64","NvFlexExtReleaseCUDA_x64","NvFlexDeviceRelease_x64")
    add_links("NvFlexReleaseCUDA_x64","NvFlexExtReleaseCUDA_x64")
    --add_linkdirs("../bin/win64")
    --add_files("../lib/win64/NvFlexReleaseCUDA_x64.lib","../lib/win64/NvFlexExtReleaseCUDA_x64.lib","../lib/win64/NvFlexDeviceRelease_x64.lib")
    

    add_cugencodes("native","compute_61")
    add_cuflags("-extended-lambda --std c++17")
    add_cuflags("-Xcompiler /bigobj")
    add_ldflags("/subsystem:console")
    add_packages("libsdl",{public=true})
