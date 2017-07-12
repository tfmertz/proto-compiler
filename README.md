# Proto Compiler

A simple docker configuration to create an image that can compile `.proto` files for Google's
[protocol buffers](https://developers.google.com/protocol-buffers/). The `protoc` binary
included in the container is the [3.3.0](https://github.com/google/protobuf/releases/tag/v3.3.0)
release. The gRPC plugin is also included and can be used to optionally compile into the
[gRPC framework](https://grpc.io/).

## Go Language

Currently the container only supports the Go language, but other languages can be supported by
extending the configuration and adding additional language plugins.

### Compiling

To compile, change into the directory containing your `.proto` files and run:
```
docker run -v `pwd`:/home tfmertz/proto_compiler --go_out=. *.proto
```

This will download the image, bring up a container, mount your current directory with the
`.proto` files into the container and then run the `protoc` command on them with the flags
that are provided.

The container only runs the `protoc` command, you have complete control over any flags
or parameters that you may want to pass:
```
docker run -v <path_to_your_proto>:/home tfmertz/proto_compiler [flags] OUTPUT
```

You can replace the absolute path to your proto files, flags, or the output file name if
you need to. You can find more information [here](https://github.com/golang/protobuf)

### gRPC

If you'd like to use the the gRPC plugin you can do so with the following flags:
```
docker run -v `pwd`:/home tfmertz/proto_compiler --go_out=plugins=grpc:. *.proto
```

Happy compiling!
