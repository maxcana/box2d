if exist "%~dp0build" rd /s /q "%~dp0build"

where cl >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo [RC_Build] Detected compiler: MSVC / Visual Studio
    set "LINKER_FLAGS=/LTCG"
    REM If you do not want a PDB, add "/DEBUG:NONE" without closing brackets here
) else (
    echo [RC_Build] Detected compiler: MinGW / GCC
    set "LINKER_FLAGS=-Wl,--strip-all -s"
)

cmake -B build ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON ^
  -DBOX2D_VALIDATE=OFF ^
  -DCMAKE_SHARED_LINKER_FLAGS="%LINKER_FLAGS%"

cmake --build build --config Release

if exist "%~dp0build\src\Release" (
    explorer "%~dp0build\src\Release"
) else (
    explorer "%~dp0build\src"
)
