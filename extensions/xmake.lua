add_rules("mode.debug","mode.release")


target("flex-ext")
    add_rules("plugin.vsxmake.autoupdate")
    if is_plat("windows") then
        add_defines("WIN64")
    else
        add_defines("PLATFORM_LINUX")
    end

    set_kind("static")

    add_includedirs("../core",{public=true})
    add_headerfiles("(../core/*.h)")

    add_files("*.cpp","*.cu","*.cxx","*.cc","cuda/*.cu")
    

    add_cugencodes("native","compute_61")
    add_cuflags("-extended-lambda --std c++17")
    add_cuflags("-Xcompiler /bigobj")
