
if [ $# -eq 0 ]; then
    path="cli/hello"
else
    path="$1"
fi

cd $ROOT/$path/_projs/c
cmake.sh _
