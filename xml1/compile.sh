#!/bin/bash

docker run --rm --name=compile-ow-swift -it -v "$(pwd):/owexec" openwhisk/action-swift-v3.1.1 bash -e -c "

if [ -z \"$1\" ] ; then
    echo 'Error: Missing action name'
    exit
fi

if [ -f \"/owexec/build/$1.zip\" ] ; then
    rm \"/owexec/build/$1.zip\"
fi

echo 'Setting up build...'

# concatenate all swift files into main.swift
cat /owexec/*.swift >> /swift3Action/spm-build/main.swift

# Add in the OW specific bits
cat /swift3Action/epilogue.swift >> /swift3Action/spm-build/main.swift
echo '_run_main(mainFunction:main)' >> /swift3Action/spm-build/main.swift

echo \"Compiling $1...\"
cd /swift3Action/spm-build
if [ -f /owexec/actions/$1/Package.swift ] ; then
    echo 'running swift build'
    # we have our own Package.swift, do a full compile
    swift build -c release
else
    echo 'Running swiftbuildandlink.sh'
    # we are using the stock Package.swift
    /swift3Action/spm-build/swiftbuildandlink.sh
fi


echo 'Creating archive $1.zip...'
# cd /swift3Action/spm-build
zip \"/owexec/build/$1.zip\" .build/release/Action

"

if [ -e "build/xml.zip" ] ; then
    wsk action update xml build/xml.zip --kind swift:3.1.1 --web true
     curl -i -H "Content-type: application/xml" -d "<root><foo>bar</foo></root>"     https://openwhisk.eu-gb.bluemix.net/api/v1/web/19FT_demo/default/xml.json
fi

