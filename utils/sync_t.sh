
if [ $# -ne 0 ]; then
  cd ../$1
fi

commit.sh ${@:2}

git pull
git push
