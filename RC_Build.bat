cmake -B build -DBOX2D_SAMPLES=ON -DBUILD_SHARED_LIBS=ON -DBOX2D_VALIDATE=OFF -DBOX2D_SANITIZE=OFF

cmake --build build --config Release

if exist "%~dp0build\src\Release" (
    explorer "%~dp0build\src\Release" : compiled with MSVC
) else (
    explorer "%~dp0build\src" : compiled with MinGW
)