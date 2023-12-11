Builds of https://github.com/libsdl-org/SDL

```sh
gh run download -D SDL2-2.28.5-macos
cd SDL2-2.28.5-macos && tar czf SDL2-2.28.5-macos.tar.gz --uid=0 --gid=0 * && cd -
mv -v SDL2-2.28.5-macos/SDL2-2.28.5-macos.tar.gz .
tar tvf SDL2-2.28.5-macos.tar.gz
gh release create 2.28.5 --notes 'Build of https://github.com/libsdl-org/SDL' SDL2-2.28.5-macos.tar.gz
```
