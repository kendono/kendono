
# C++ Hello

```
Hello, world!
```

## Development Environment

- Windows
	- MSBuild (Visual Studio)
- Unix
	- GCC
	- Clang
- CMake

## Creating a Project

- `CMakeLists.txt`
- `src/`
	- `main.cc`

## CMakeLists.txt

```
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
```

## src/main.cc

```cpp
#include <iostream>

int main() {
	std::cout << "Hello, world!" << std::endl;
	return 0;
}
```

## Build & Run

```sh
cmake -S . -B .target
cmake --build .target
.target/hello
```

## Scripting: cmake.sh

```sh
# building only if there is no argument
cmake -S . -B .target &&
cmake --build .target

# if there is an argument, run the target
if [ $# -ne 0 ]; then
	.target/$1
fi
```

```sh
sh cmake.sh hello
```

## Result

```
Hello, world!
```
