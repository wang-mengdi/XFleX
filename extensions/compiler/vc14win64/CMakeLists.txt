set(PROJECT_NAME flexExtCUDA)

################################################################################
# Source groups
################################################################################
set(core
    "../../../core/aabbtree.cpp"
    "../../../core/maths.cpp"
    "../../../core/sdf.cpp"
    "../../../core/voxelize.cpp"
)
source_group("core" FILES ${core})

set(cuda
    "../../cuda/flexExt.cu"
)
source_group("cuda" FILES ${cuda})

set(src
    "../../flexExtCloth.cpp"
    "../../flexExtContainer.cpp"
    "../../flexExtMovingFrame.cpp"
    "../../flexExtRigid.cpp"
    "../../flexExtSoft.cpp"
)
source_group("src" FILES ${src})

set(ALL_FILES
    ${core}
    ${cuda}
    ${src}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE flexExtCUDA)

################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "NvFlexExtDebugCUDA_x64"
    TARGET_NAME_RELEASE "NvFlexExtReleaseCUDA_x64"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./../../../bin/win64"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../../../bin/win64"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./../../../lib/win64"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../../../lib/win64"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "NvFlexExtDebugCUDA_x64"
    ARCHIVE_OUTPUT_NAME_RELEASE "NvFlexExtReleaseCUDA_x64"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../.."
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
    "WIN32"
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
set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "$<$<CONFIG:debug>:"
        "./../../../lib/win64/NvFlexDebugCUDA_x64"
    ">"
    "$<$<CONFIG:release>:"
        "./../../../lib/win64/NvFlexReleaseCUDA_x64"
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
    "odbccp32"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "$ENV{CUDA_PATH}/lib/x64"
)

