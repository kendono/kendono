
cd .website

if [ $# -eq 0 ]; then
    msg="default commit"
else
    msg="$@"
fi

git add .
git commit -am "$msg"

git pull
git push
