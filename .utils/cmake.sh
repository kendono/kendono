
build=".cmake/target"
bin="$build/bin"

cmake -S . -B $build &&
cmake --build $build &&
if [ $# -ne 0 ]; then
  $bin/$1
fi
