cmake_minimum_required(VERSION 3.21)
project(project1)

# Set the C standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the name of the future application (in Windows this will be app.exe, 
# while for the web it would be app.js / app.wasm)
add_executable(app)

# Specify the exact location of the library configuration files
# The variable name must strictly follow the pattern: LibraryName_DIR
set(SDL3_DIR "${CMAKE_CURRENT_SOURCE_DIR}/SDL3/x86_64-w64-mingw32/lib/cmake/SDL3")

# Add the source code to the project
target_sources(app
    PRIVATE
    main.cpp
    glad.c
)

# Check for the presence of libraries in the system
# If they are not found, CMake will abort the configuration with an error
# REQUIRED means the package is mandatory for the build
find_package(SDL3 REQUIRED)

# Link the libraries to our application
target_link_libraries(app PRIVATE SDL3::SDL3)

target_include_directories(app PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/glad_include"
)