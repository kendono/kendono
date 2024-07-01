
add_path() {
  export PATH=$PATH:$1
}

add_path $(pwd)/_utils

add_path $(pwd)/.tools/vcpkg
