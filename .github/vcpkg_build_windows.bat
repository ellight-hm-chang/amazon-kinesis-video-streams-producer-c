call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat" x86_amd64
mkdir build
cd build
cmd.exe /c cmake -G "Visual Studio 17 2022" ..
cmake -G "Visual Studio 17 2022" ^
-DBUILD_TEST=TRUE ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_TOOLCHAIN_FILE="C:/vcpkg/scripts/buildsystems/vcpkg.cmake" ^
-DCMAKE_PREFIX_PATH="C:/vcpkg/installed/x64-windows" ^
-DCMAKE_INSTALL_PREFIX="C:/Source/kvs_supergiftpack" ^
-DGTest_DIR="C:/vcpkg/installed/x64-windows/share/gtest" ^
-DPKG_CONFIG_EXECUTABLE="C:/vcpkg/packages/pkgconf_x64-windows/tools/pkgconf/pkgconf.exe" ^
-DBUILD_COMMON_LWS=TRUE ^
-DBUILD_COMMON_CURL=TRUE ^
..
cmake --build . --config Release --target install
cd ..