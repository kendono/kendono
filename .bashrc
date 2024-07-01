
add_path() {
  export PATH=$PATH:$1
}

add_path $(pwd)/.utils

add_path $(pwd)/.tools/vcpkg
