#!/bin/bash

if [ -z "$1" ] ; then
    echo 'Error: Missing action name'
    exit
fi

# ensure build directory exists
mkdir -p ./build

# remove current zip file
if [ -f "./build/$1.zip" ] ; then
    rm "./build/$1.zip"
fi

# compile Swift action and zip
docker run --rm --name=compile-ow-swift -it -v "$(pwd):/owexec" openwhisk/action-swift-v3.1.1 bash -e -c "

echo 'Setting up build...'
if [ -d "/owexec/$1" ] ; then
    # directory with this action name exists.

    if [ -f /owexec/$1/Package.swift ] ; then
        # copy over everything as we have a Package.swift
        cp /owexec/$1/*.swift /swift3Action/spm-build/
    
        # ensure action file is called main.swift
        if [ -f \"/swift3Action/spm-build/$1.swift\" ] ; then
            mv \"/swift3Action/spm-build/$1.swift\" /swift3Action/spm-build/main.swift
        fi
    else
        # concatenate everything to main.swift so we can use swiftbuildandlink.sh
        # This is a bit of a hack but makes compilation *much* faster!
        cat /owexec/$1/*.swift >> /swift3Action/spm-build/main.swift
    fi
else
    # action name is a file in this directory
    if [ ! -f \"/owexec/$1.swift\" ] ; then
        echo \"Error: Cannot find file $1.swift\"
        exit 1
    fi
    cp /owexec/$1.swift /swift3Action/spm-build/main.swift
fi

# Add in the OW specific bits to main.swift
cat /swift3Action/epilogue.swift >> /swift3Action/spm-build/main.swift
echo '_run_main(mainFunction:main)' >> /swift3Action/spm-build/main.swift

echo \"Compiling $1...\"
cd /swift3Action/spm-build
if [ -f /owexec/$1/Package.swift ] ; then
    # we have our own Package.swift, do a full compile
    echo 'running swift build'
    swift build -c release
else
    # we are using the stock Package.swift
    echo 'Running swiftbuildandlink.sh'
    /swift3Action/spm-build/swiftbuildandlink.sh
fi


echo 'Creating archive $1.zip...'
zip \"/owexec/build/$1.zip\" .build/release/Action

"

if [ $? -ne 0 ]; then
    exit
fi

if [ -e "build/$1.zip" ] ; then
    wsk action update $1 build/$1.zip --kind swift:3.1.1 --web true
    # curl -i -H "Content-type: application/xml" -H "X-Clacks: application/xml;application/json" -d "<root><foo>bar</foo></root>" https://openwhisk.eu-gb.bluemix.net/api/v1/web/19FT_demo/default/$1.json
fi

