
clone() {
    git clone https://github.com/kendono/kendono .repair
}

if clone; then
    rm -rf .git
    mv .repair/.git .git
    rm -rf .repair
    sh sync.sh $@
fi
