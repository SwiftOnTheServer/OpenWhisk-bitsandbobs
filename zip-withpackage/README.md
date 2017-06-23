# Test compiled Swift actions

1. Update to the latest docker container:

```
$ docker pull openwhisk/swift3action:latest
```

2. Compile `hello.swift` to a Swift binary and then zip it to create `hello.zip`:

```
$ ./compile.sh hello
Compiling
swiftc status is 0
Linking
  adding: .build/release/Action (deflated 68%)
```

This has placed `hello.zip` in the same directory as `hello.swift`.

23 Upload to OpenWhisk:

```
$ wsk action update helloSwiftly hello.zip --kind swift:3
ok: updated action helloSwiftly
```

4. Invoke the action:

```
$ wsk action invoke helloSwiftly --blocking
```

Check that the output is the output of the `echo` system action.
