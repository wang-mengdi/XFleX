cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

project(flexDemoCUDA CXX)

################################################################################
# Set target arch type if empty. Visual studio solution generator provides it.
################################################################################
if(NOT CMAKE_VS_PLATFORM_NAME)
    set(CMAKE_VS_PLATFORM_NAME "x64")
endif()
message("${CMAKE_VS_PLATFORM_NAME} architecture in use")

if(NOT ("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64"))
    message(FATAL_ERROR "${CMAKE_VS_PLATFORM_NAME} arch is not supported!")
endif()

################################################################################
# Global configuration types
################################################################################
set(CMAKE_CONFIGURATION_TYPES
    "debug"
    "release"
    CACHE STRING "" FORCE
)

################################################################################
# Global compiler options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_CXX_FLAGS "")
    set(CMAKE_CXX_FLAGS_DEBUG "")
    set(CMAKE_CXX_FLAGS_RELEASE "")
endif()

################################################################################
# Global linker options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_EXE_LINKER_FLAGS "")
    set(CMAKE_MODULE_LINKER_FLAGS "")
    set(CMAKE_SHARED_LINKER_FLAGS "")
    set(CMAKE_STATIC_LINKER_FLAGS "")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS}")
endif()

################################################################################
# Nuget packages function stub.
################################################################################
function(use_package TARGET PACKAGE VERSION)
    message(WARNING "No implementation of use_package. Create yours. "
                    "Package \"${PACKAGE}\" with version \"${VERSION}\" "
                    "for target \"${TARGET}\" is ignored!")
endfunction()

################################################################################
# Common utils
################################################################################
include(CMake/Utils.cmake)

################################################################################
# Additional Global Settings(add specific info there)
################################################################################
include(CMake/GlobalSettingsInclude.cmake OPTIONAL)

################################################################################
# Use solution folders feature
################################################################################
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
# Sub-projects
################################################################################
add_subdirectory(../../../extensions/compiler/vc14win64 ${CMAKE_BINARY_DIR}/flexExtCUDA)



























set(PROJECT_NAME flexDemoCUDA)

################################################################################
# Source groups
################################################################################
set(core
    "../../../core/aabbtree.cpp"
    "../../../core/aabbtree.h"
    "../../../core/cloth.h"
    "../../../core/convex.h"
    "../../../core/core.cpp"
    "../../../core/core.h"
    "../../../core/extrude.cpp"
    "../../../core/extrude.h"
    "../../../core/mat22.h"
    "../../../core/mat33.h"
    "../../../core/mat44.h"
    "../../../core/maths.cpp"
    "../../../core/maths.h"
    "../../../core/matnn.h"
    "../../../core/mesh.cpp"
    "../../../core/mesh.h"
    "../../../core/perlin.cpp"
    "../../../core/perlin.h"
    "../../../core/pfm.cpp"
    "../../../core/pfm.h"
    "../../../core/platform.cpp"
    "../../../core/platform.h"
    "../../../core/png.cpp"
    "../../../core/png.h"
    "../../../core/point3.h"
    "../../../core/quat.h"
    "../../../core/sdf.cpp"
    "../../../core/sdf.h"
    "../../../core/tga.cpp"
    "../../../core/tga.h"
    "../../../core/types.h"
    "../../../core/vec2.h"
    "../../../core/vec3.h"
    "../../../core/vec4.h"
    "../../../core/voxelize.cpp"
    "../../../core/voxelize.h"
)
source_group("core" FILES ${core})

set(d3d
    "../../d3d/appGraphCtx.h"
    "../../d3d/appGraphCtxLoader.cpp"
    "../../d3d/imguiGraph.cpp"
    "../../d3d/imguiGraph.h"
    "../../d3d/imguiGraphLoader.cpp"
    "../../d3d/loader.cpp"
    "../../d3d/loader.h"
    "../../d3d/loaderMacros.h"
    "../../d3d/renderParamsD3D.cpp"
    "../../d3d/renderParamsD3D.h"
    "../../d3d/shaderCommonD3D.h"
)
source_group("d3d" FILES ${d3d})

set(d3d11
    "../../d3d11/appD3D11Ctx.cpp"
    "../../d3d11/appD3D11Ctx.h"
    "../../d3d11/debugLineRenderD3D11.cpp"
    "../../d3d11/debugLineRenderD3D11.h"
    "../../d3d11/demoContextD3D11.cpp"
    "../../d3d11/demoContextD3D11.h"
    "../../d3d11/diffuseRenderD3D11.cpp"
    "../../d3d11/diffuseRenderD3D11.h"
    "../../d3d11/fluidRenderD3D11.cpp"
    "../../d3d11/fluidRenderD3D11.h"
    "../../d3d11/imguiGraphD3D11.cpp"
    "../../d3d11/imguiGraphD3D11.h"
    "../../d3d11/imguiInteropD3D11.cpp"
    "../../d3d11/meshRenderD3D11.cpp"
    "../../d3d11/meshRenderD3D11.h"
    "../../d3d11/pointRenderD3D11.cpp"
    "../../d3d11/pointRenderD3D11.h"
    "../../d3d11/renderTargetD3D11.cpp"
    "../../d3d11/renderTargetD3D11.h"
    "../../d3d11/shadowMapD3D11.cpp"
    "../../d3d11/shadowMapD3D11.h"
)
source_group("d3d11" FILES ${d3d11})

set(d3d12
    "../../d3d12/appD3D12Ctx.cpp"
    "../../d3d12/appD3D12Ctx.h"
    "../../d3d12/bufferD3D12.cpp"
    "../../d3d12/bufferD3D12.h"
    "../../d3d12/demoContextD3D12.cpp"
    "../../d3d12/demoContextD3D12.h"
    "../../d3d12/diffusePointRenderPipelineD3D12.cpp"
    "../../d3d12/diffusePointRenderPipelineD3D12.h"
    "../../d3d12/fluidCompositeRenderPipelineD3D12.cpp"
    "../../d3d12/fluidCompositeRenderPipelineD3D12.h"
    "../../d3d12/fluidEllipsoidRenderPipelineD3D12.cpp"
    "../../d3d12/fluidEllipsoidRenderPipelineD3D12.h"
    "../../d3d12/fluidSmoothRenderPipelineD3D12.cpp"
    "../../d3d12/fluidSmoothRenderPipelineD3D12.h"
    "../../d3d12/fluidThicknessRenderPipelineD3D12.cpp"
    "../../d3d12/fluidThicknessRenderPipelineD3D12.h"
    "../../d3d12/imguiGraphD3D12.cpp"
    "../../d3d12/imguiGraphD3D12.h"
    "../../d3d12/imguiInteropD3D12.cpp"
    "../../d3d12/lineRenderPipelineD3D12.cpp"
    "../../d3d12/lineRenderPipelineD3D12.h"
    "../../d3d12/meshRenderer.cpp"
    "../../d3d12/meshRenderer.h"
    "../../d3d12/meshRendererD3D12.cpp"
    "../../d3d12/meshRendererD3D12.h"
    "../../d3d12/meshRenderPipelineD3D12.cpp"
    "../../d3d12/meshRenderPipelineD3D12.h"
    "../../d3d12/meshUtil.cpp"
    "../../d3d12/meshUtil.h"
    "../../d3d12/NvCoDx12CircularResourceHeap.cpp"
    "../../d3d12/NvCoDx12CircularResourceHeap.h"
    "../../d3d12/NvCoDx12CounterFence.cpp"
    "../../d3d12/NvCoDx12CounterFence.h"
    "../../d3d12/NvCoDx12DescriptorHeap.cpp"
    "../../d3d12/NvCoDx12DescriptorHeap.h"
    "../../d3d12/NvCoDx12Handle.h"
    "../../d3d12/NvCoDx12HelperUtil.cpp"
    "../../d3d12/NvCoDx12HelperUtil.h"
    "../../d3d12/NvCoDx12RenderTarget.cpp"
    "../../d3d12/NvCoDx12RenderTarget.h"
    "../../d3d12/NvCoDx12Resource.cpp"
    "../../d3d12/NvCoDx12Resource.h"
    "../../d3d12/NvCoDx12ResourceScopeManager.cpp"
    "../../d3d12/NvCoDx12ResourceScopeManager.h"
    "../../d3d12/NvCoDxDebugUtil.cpp"
    "../../d3d12/NvCoDxDebugUtil.h"
    "../../d3d12/NvCoDxFormatUtil.cpp"
    "../../d3d12/NvCoDxFormatUtil.h"
    "../../d3d12/NvCoFreeList.cpp"
    "../../d3d12/NvCoFreeList.h"
    "../../d3d12/NvResult.h"
    "../../d3d12/pipelineUtilD3D12.cpp"
    "../../d3d12/pipelineUtilD3D12.h"
    "../../d3d12/pointRenderPipelineD3D12.cpp"
    "../../d3d12/pointRenderPipelineD3D12.h"
    "../../d3d12/renderStateD3D12.cpp"
    "../../d3d12/renderStateD3D12.h"
)
source_group("d3d12" FILES ${d3d12})

set(demo
    "../../benchmark.h"
    "../../demoContext.h"
    "../../helpers.h"
    "../../imgui.cpp"
    "../../imgui.h"
    "../../main.cpp"
    "../../scenes.h"
    "../../shaders.h"
    "../../shadersDemoContext.cpp"
    "../../shadersDemoContext.h"
    "../../stb_truetype.h"
)
source_group("demo" FILES ${demo})

set(demo__scenes
    "../../scenes/adhesion.h"
    "../../scenes/armadilloshower.h"
    "../../scenes/bananas.h"
    "../../scenes/bouyancy.h"
    "../../scenes/bunnybath.h"
    "../../scenes/ccdfluid.h"
    "../../scenes/clothlayers.h"
    "../../scenes/dambreak.h"
    "../../scenes/darts.h"
    "../../scenes/debris.h"
    "../../scenes/deformables.h"
    "../../scenes/envcloth.h"
    "../../scenes/flag.h"
    "../../scenes/fluidblock.h"
    "../../scenes/fluidclothcoupling.h"
    "../../scenes/forcefield.h"
    "../../scenes/frictionmoving.h"
    "../../scenes/frictionramp.h"
    "../../scenes/gamemesh.h"
    "../../scenes/googun.h"
    "../../scenes/granularpile.h"
    "../../scenes/granularshape.h"
    "../../scenes/inflatable.h"
    "../../scenes/initialoverlap.h"
    "../../scenes/lighthouse.h"
    "../../scenes/localspacecloth.h"
    "../../scenes/localspacefluid.h"
    "../../scenes/lowdimensionalshapes.h"
    "../../scenes/melting.h"
    "../../scenes/mixedpile.h"
    "../../scenes/nonconvex.h"
    "../../scenes/parachutingbunnies.h"
    "../../scenes/pasta.h"
    "../../scenes/player.h"
    "../../scenes/potpourri.h"
    "../../scenes/rayleightaylor.h"
    "../../scenes/restitution.h"
    "../../scenes/rigidfluidcoupling.h"
    "../../scenes/rigidpile.h"
    "../../scenes/rigidrotation.h"
    "../../scenes/rockpool.h"
    "../../scenes/sdfcollision.h"
    "../../scenes/shapechannels.h"
    "../../scenes/shapecollision.h"
    "../../scenes/softbody.h"
    "../../scenes/spherecloth.h"
    "../../scenes/surfacetension.h"
    "../../scenes/tearing.h"
    "../../scenes/thinbox.h"
    "../../scenes/trianglecollision.h"
    "../../scenes/triggervolume.h"
    "../../scenes/viscosity.h"
    "../../scenes/waterballoon.h"
)
source_group("demo\\scenes" FILES ${demo__scenes})

set(include
    "../../../include/NvFlex.h"
    "../../../include/NvFlexDevice.h"
    "../../../include/NvFlexExt.h"
)
source_group("include" FILES ${include})

set(opengl
    "../../opengl/demoContextOGL.h"
    "../../opengl/imguiRenderGL.cpp"
    "../../opengl/imguiRenderGL.h"
    "../../opengl/shader.cpp"
    "../../opengl/shader.h"
    "../../opengl/shadersGL.cpp"
    "../../opengl/utilsGL.h"
)
source_group("opengl" FILES ${opengl})

set(ALL_FILES
    ${core}
    ${d3d}
    ${d3d11}
    ${d3d12}
    ${demo}
    ${demo__scenes}
    ${include}
    ${opengl}
)

################################################################################
# Target
################################################################################
add_executable(${PROJECT_NAME} ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE flexDemoCUDA)

################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "NvFlexDemoDebugCUDA_x64"
    TARGET_NAME_RELEASE "NvFlexDemoReleaseCUDA_x64"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./../../../bin/win64"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../../../bin/win64"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${OUTPUT_DIRECTORY}"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${OUTPUT_DIRECTORY}"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "${TARGET_NAME}"
    ARCHIVE_OUTPUT_NAME_RELEASE "${TARGET_NAME}"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY         "${OUTPUT_DIRECTORY}"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    INTERPROCEDURAL_OPTIMIZATION_RELEASE "TRUE"
)
################################################################################
# MSVC runtime library
################################################################################
get_property(MSVC_RUNTIME_LIBRARY_DEFAULT TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY)
string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
    $<$<CONFIG:debug>:
        MultiThreadedDebug
    >
    $<$<CONFIG:release>:
        MultiThreaded
    >
    $<$<NOT:$<OR:$<CONFIG:debug>,$<CONFIG:release>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
)
set_target_properties(${PROJECT_NAME} PROPERTIES MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_LIBRARY_STR})

################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC
    "$ENV{CUDA_PATH}/include;"
    "$ENV{CUDA_PATH}/extras/cupti/include;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../..;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../..;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../d3d11;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../d3d12;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../external/SDL2-2.0.4/include;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../external/D3D12/include"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "$<$<CONFIG:debug>:"
        "_DEBUG;"
        "_ITERATOR_DEBUG_LEVEL=0"
    ">"
    "$<$<CONFIG:release>:"
        "NDEBUG"
    ">"
    "_CONSOLE;"
    "WIN32;"
    "_CRT_SECURE_NO_WARNINGS"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:debug>:
            /Od;
            /fp:precise
        >
        $<$<CONFIG:release>:
            /Ox;
            /Oi;
            /arch:SSE2;
            /Gy;
            /fp:fast;
            /GS-
        >
        /W3;
        ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT};
        /d2Zi+;
        ${DEFAULT_CXX_EXCEPTION_HANDLING};
        /Y-
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        /DEBUG;
        /MACHINE:X64;
        /SUBSYSTEM:CONSOLE;
        /DELAYLOAD:d3d11.dll;
        /DELAYLOAD:d3d12.dll;
        /DELAYLOAD:dxgi.dll
    )
endif()

################################################################################
# Dependencies
################################################################################
# Link with other targets.
target_link_libraries(${PROJECT_NAME} PRIVATE
    flexExtCUDA
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "$<$<CONFIG:debug>:"
        "./../../../lib/win64/NvFlexDebugCUDA_x64;"
        "./../../../lib/win64/NvFlexExtDebugCUDA_x64;"
        "./../../../lib/win64/NvFlexDeviceDebug_x64"
    ">"
    "$<$<CONFIG:release>:"
        "./../../../lib/win64/NvFlexReleaseCUDA_x64;"
        "./../../../lib/win64/NvFlexExtReleaseCUDA_x64;"
        "./../../../lib/win64/NvFlexDeviceRelease_x64"
    ">"
    "cudart;"
    "kernel32;"
    "user32;"
    "gdi32;"
    "winspool;"
    "comdlg32;"
    "advapi32;"
    "shell32;"
    "ole32;"
    "oleaut32;"
    "uuid;"
    "odbc32;"
    "odbccp32;"
    "d3dcompiler;"
    "delayimp;"
    "./../../../external/SDL2-2.0.4/lib/x64/SDL2;"
    "./../../../external/SDL2-2.0.4/lib/x64/SDL2main;"
    "./../../../external/NvToolsExt/lib/x64/nvToolsExt64_1;"
    "./../../../external/D3D12/libs/x64/d3d12"
)
target_link_libraries(${PROJECT_NAME} PRIVATE "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PRIVATE
    "$ENV{CUDA_PATH}/lib/x64"
)

