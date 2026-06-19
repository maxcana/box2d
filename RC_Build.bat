cmake -B build -DBOX2D_SAMPLES=ON -DBUILD_SHARED_LIBS=ON -DBOX2D_VALIDATE=OFF -DBOX2D_SANITIZE=OFF

cmake --build build --config Release

explorer "E:\dev\forks\box2d\build\src\Release"