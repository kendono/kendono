
cmake_minimum_required(VERSION 4.0)

project(hello)

set(CMAKE_CXX_STANDARD 20)

set(OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${OUTPUT_DIRECTORY})

if(MSVC)
    add_compile_options(
        /std:c++latest
    )
endif()

file(GLOB_RECURSE SOURCE_FILES src/*)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
