
# cmake version
cmake_minimum_required(VERSION 4.0)

# define a project
project(hello)

# consistent output directory
set(OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${OUTPUT_DIRECTORY})

# designate all source files
file(GLOB_RECURSE SOURCE_FILES src/*)

# add source files to an executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
