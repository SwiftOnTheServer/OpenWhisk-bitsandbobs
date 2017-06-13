# Swift action using SPM

Example Swift action (hello-package) that uses Swift Package Manager for dependencies.

## Installation

1. `./compile.sh hello-package`
2. `wsk action update hello-package build/hello-package.zip --kind swift:3`
3. `wsk action invoke hello-package -br`
