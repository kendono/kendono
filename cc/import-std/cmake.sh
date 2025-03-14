# building only if there is no argument
cmake -S . -B .target &&
cmake --build .target

# if there is an argument, run the target
if [ $# -ne 0 ]; then
	.target/$1
fi