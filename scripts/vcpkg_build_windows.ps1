# vcpkg_build_windows.ps1

param(
    [string]$vcvarsPath = "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat",
    [string]$installPath = "C:/Source/kvs_supergiftpack/",
    [string]$vcpkgTriplet = "x64-windows",
    [string]$toolchainFile = "C:/vcpkg/scripts/buildsystems/vcpkg.cmake"
)

$installPrefix = Join-Path $installPath "producer"
$buildDir = "build"

$env:VCPKG_DEFAULT_TRIPLET = $vcpkgTriplet

& $vcvarsPath x86_amd64

if (-not (Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}
Push-Location $buildDir

cmake -G "Visual Studio 17 2022" `
    -DBUILD_TEST=TRUE `
    -DCMAKE_BUILD_TYPE=Release `
    -DCMAKE_TOOLCHAIN_FILE="$toolchainFile" `
    -DCMAKE_INSTALL_PREFIX="$installPrefix" `
    -DBUILD_COMMON_LWS=TRUE `
    -DBUILD_COMMON_CURL=TRUE `
    ..

cmake --build . --config Release --target install

Pop-Location