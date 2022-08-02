#!/bin/zsh
 
arch_name="$(uname -m)"

echo "***** Installing BREW *****"
 
if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        echo "Running on Rosetta 2"
        
        arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        echo "Running on native Intel"
        
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
elif [ "${arch_name}" = "arm64" ]; then
    echo "Running on ARM"
    
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/vasilemorari/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Unknown architecture: ${arch_name}"
fi

echo "***** Installing SOURCERY CLI *****"

brew install sourcery
