
lib=".libraries"
tools=".tools"

git clone https://github.com/glfw/glfw $lib/glfw
git clone https://github.com/g-truc/glm $lib/glm

git clone https://github.com/conan-io/conan $tools/conan
git clone https://github.com/microsoft/vcpkg $tools/vcpkg

sh .tools/vcpkg/bootstrap-vcpkg.sh
