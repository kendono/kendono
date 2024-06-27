
if [ $# -eq 0 ]; then
  msg="default commit"
else
  msg="$@"
fi

git add .
git commit -am "$msg"
