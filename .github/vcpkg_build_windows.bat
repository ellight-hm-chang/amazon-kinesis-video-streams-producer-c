call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat" x86_amd64
set VCPKG_DEFAULT_TRIPLET=x64-windows
mkdir build
cd build
cmake -G "Visual Studio 17 2022" ^
-DBUILD_TEST=TRUE ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_TOOLCHAIN_FILE="C:/vcpkg/scripts/buildsystems/vcpkg.cmake" ^
-DCMAKE_GENERATOR_PLATFORM=x64 ^
-DCMAKE_INSTALL_PREFIX="C:/Source/kvs_supergiftpack/producer" ^
-DBUILD_COMMON_LWS=TRUE ^
-DBUILD_COMMON_CURL=TRUE ^
..
cmake --build . --config Release --target install
cd ..