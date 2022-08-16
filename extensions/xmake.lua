add_rules("mode.debug","mode.release")


target("flex-ext")
    add_rules("plugin.vsxmake.autoupdate")
    --add_cxxflags("-std=c++0x","-fPIC","-ffast-math")
    --add_ldflags("-m64","-lm","-ffast-math")
    if is_plat("windows") then
        add_defines("WIN64")
    else
        add_defines("PLATFORM_LINUX")
    end

    set_kind("static")
    --add_includedirs(".",{public=true})
    --add_headerfiles("(./*.h)")

    add_includedirs("../core",{public=true})
    add_headerfiles("(../core/*.h)")

    add_files("*.cpp","*.cu","*.cxx","*.cc","cuda/*.cu")
    --add_files("../core/*.cpp")
    --add_files("opengl/*.cpp")


    --add_includedirs("../include",{public=true})
    --add_headerfiles("(../include/*.h)")
    --add_includedirs("../lib/win64",{public=true})
    --add_linkdirs("../lib/win64","../lib/linux64")
    --add_links("NvFlexReleaseCUDA_x64","NvFlexExtReleaseCUDA_x64","NvFlexDeviceRelease_x64")
    --add_links("NvFlexReleaseCUDA_x64","NvFlexExtReleaseCUDA_x64")
    --add_linkdirs("../bin/win64")
    --add_files("../lib/win64/NvFlexReleaseCUDA_x64.lib","../lib/win64/NvFlexExtReleaseCUDA_x64.lib","../lib/win64/NvFlexDeviceRelease_x64.lib")
    

    add_cugencodes("native","compute_61")
    add_cuflags("-extended-lambda --std c++17","-rdc=true")
    add_cuflags("-Xcompiler /bigobj")
    --add_ldflags("/subsystem:console")
    --add_packages("libsdl",{public=true})
