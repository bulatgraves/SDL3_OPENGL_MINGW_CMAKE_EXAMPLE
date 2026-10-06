cmake -G "MinGW Makefiles" -S . -B dist/win -DCMAKE_BUILD_TYPE=Debug
cd dist\win
cmake --build .
cd ..\..
dist\win\app