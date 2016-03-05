# Build GRPC with CMake on Windows/OSX

- http://www.grpc.io/
- http://doc.oschina.net/grpc (简体中文)

# Build on Windows with MSVC2015

## Generate `GRPC.sln` for debug (WIN32)

- Install [CMake3.1+][CMake] and [MSVC2015][MSVC2015]
- Add `./3rdparty/openssl/openssl-win32/bin` to `$PATH`
- Run `build-debug-proj-mt.bat`


## Build for WIN32

- Install [CMake3.1+][CMake] and [MSVC2015][MSVC2015]
- Add `./3rdparty/openssl/openssl-win32/bin` to `$PATH`
- Run `build-win32.bat`


## Build for WIN64

- Install [CMake3.1+][CMake] and [MSVC2015][MSVC2015]
- Add `./3rdparty/openssl/openssl-win64/bin` to `$PATH`
- Run `build-win43.bat`

# Build on OSX

- Install [CMake3.1+][CMake] and GCC
- Build with CMake

# BUGS

Report bugs to <chaishushan@gmail.com>.

Thanks!


[CMake]: http://www.cmake.org/
[MSVC2015]: https://www.visualstudio.com/
