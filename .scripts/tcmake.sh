
if [ $# -eq 0 ]; then
    path="cli/_projs/cc"
else
    path="$1"
fi

cd $ROOT/$path
cmake.sh _
