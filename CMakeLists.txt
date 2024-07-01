
cmake_minimum_required(VERSION 3.30)

project(cmake)

include(.cmake/config.cmake)
include(.cmake/functions.cmake)

include_directories(_includes)

link_directories(${CMAKE_BINARY_DIR}/bin)
link_directories(${CMAKE_BINARY_DIR}/lib)

# LIBRARY PHASE

create_library(c)
create_modules_library(cc)

# BINARY PHASE

create_binaries(c)
create_binaries(cc)
