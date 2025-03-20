
if git clone https://github.com/kendono/kendono .repair; then

mv .repair/.git .git
rm -rf .repair

if [ $# -eq 0 ]; then
    msg="default commit"
else
    msg="$@"
fi

git add .
git commit -am "$msg"

git pull
git push

fi
