
if [ $# -eq 0 ]; then
  target="_"
else
  target="$1"
fi

rscript _codefiles/r/$target.r
