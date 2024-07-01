#!/bin/bash

# Function to compare version numbers
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

# Minimum required version
required_version="3.30.0"

# Check if CMake is installed
if ! command -v cmake &> /dev/null
then
    echo "CMake is not installed."
    exit 1
fi

# Get current CMake version
current_version=$(cmake --version | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -1)

# Compare versions
vercomp $current_version $required_version
comparison=$?

if [ $comparison -eq 0 ] || [ $comparison -eq 1 ]; then
    echo "CMake version is $current_version, which is equal to or greater than $required_version."
    exit 0
else
    echo "CMake version is $current_version, which is less than $required_version."
    exit 1
fi
