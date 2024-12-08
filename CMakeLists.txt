cmake_minimum_required(VERSION 3.10)

# Project name
project(MyMathLibrary)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)  # For static libraries
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)  # For shared libraries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)   # For executables

# Create static library
add_library(mathlib_static STATIC
    src/sum.cpp
    src/version.cpp
    src/shapes/rectangle.cpp
)

# Create shared library
add_library(mathlib_shared SHARED
    src/sum.cpp
    src/version.cpp
    src/shapes/rectangle.cpp
)

# Set library output names
set_target_properties(mathlib_static PROPERTIES OUTPUT_NAME mathlib)
set_target_properties(mathlib_shared PROPERTIES OUTPUT_NAME mathlib)

# Include directories for both libraries
target_include_directories(mathlib_static PUBLIC src)
target_include_directories(mathlib_shared PUBLIC src)

# Create example executable that uses the shared library
add_executable(calculator_example
    src/main.cpp
)

# Link the executable with the shared library
target_link_libraries(calculator_example PRIVATE mathlib_shared)

message("CMAKE_BINARY_DIR is: ${CMAKE_BINARY_DIR}")

# Add custom command to copy libraries after build
add_custom_command(
    TARGET mathlib_shared POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/../../libs
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/libs ${CMAKE_BINARY_DIR}/../libs
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/src/sum.h ${CMAKE_BINARY_DIR}/../libs/sum.h    
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/src/version.h ${CMAKE_BINARY_DIR}/../libs/version.h
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/src/shapes/rectangle.h ${CMAKE_BINARY_DIR}/../libs/rectangle.h
    COMMAND ${CMAKE_COMMAND} -E echo "Copy completed"
)