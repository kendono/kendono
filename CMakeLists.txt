
cmake_minimum_required(VERSION 3.28)

project(cmake)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin)

file(GLOB_RECURSE bin_files_c _bin/*.c)
file(GLOB_RECURSE bin_files_cc _bin/*.cc)

file(GLOB_RECURSE src_files_c _src/*.c)
file(GLOB_RECURSE src_files_cc _src/*.cc)

add_library(cmake_lib_c ${src_files_c})
add_library(cmake_lib_cc ${src_files_cc})

foreach(file ${bin_files_c})
    get_filename_component(name ${file} NAME_WLE)
    add_executable(c_${name} ${file})
    target_include_directories(c_${name} PUBLIC _inc)
    target_include_directories(c_${name} PUBLIC _inc/c)
    target_link_libraries(c_${name} cmake_lib_c)
    set_target_properties(c_${name} PROPERTIES
        OUTPUT_NAME ${name}
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/c
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/c
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/c
    )
endforeach()

foreach(file ${bin_files_cc})
    get_filename_component(name ${file} NAME_WLE)
    add_executable(cc_${name} ${file})
    target_include_directories(cc_${name} PUBLIC _inc)
    target_include_directories(cc_${name} PUBLIC _inc/cc)
    target_link_libraries(cc_${name} cmake_lib_cc)
    set_target_properties(cc_${name} PROPERTIES
        OUTPUT_NAME ${name}
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/cc
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/cc
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/cc
    )
endforeach()
