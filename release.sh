#!/usr/bin/env sh

rm -rf ./tmp
gh run download -D tmp -n SDL2-2.28.5

cd tmp

# TODO: on mac, use
#
#   --uid=0 --gid=0
#
tar czvf SDL2-2.28.5-linux.tar.gz --owner=0 --group=0 SDL2-2.28.5-linux/include SDL2-2.28.5-linux/lib/libSDL2.a SDL2-2.28.5-linux/lib/libSDL2.so

echo "==> zig fetch returned"
tree ~/.cache/zig/p/$(zig fetch file://`realpath SDL2-2.28.5-linux.tar.gz`)

gh release upload --clobber 2.28.5 tmp/SDL2-2.28.5-linux.tar.gz

# TODO: DRY this up

tar czvf SDL2-2.28.5-macos.tar.gz --owner=0 --group=0 SDL2-2.28.5-macos/include SDL2-2.28.5-macos/lib/libSDL2.a SDL2-2.28.5-macos/lib/libSDL2.dylib

echo "==> zig fetch returned"
tree ~/.cache/zig/p/$(zig fetch file://`realpath SDL2-2.28.5-macos.tar.gz`)

gh release upload --clobber 2.28.5 tmp/SDL2-2.28.5-macos.tar.gz
