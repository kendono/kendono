
cmake -S . -B .build &&
cmake --build .build &&
if [ $# -eq 0 ]; then
  .build/bin/cc/_
else
  .build/bin/$1
fi
