rmdir /s /q ".\build"

cmake -B build -DBOX2D_SAMPLES=ON -DBOX2D_VALIDATE=ON -DBOX2D_SANITIZE=OFF -DBOX2D_UNIT_TESTS=ON

cmake --build build

.\build\bin\test.exe