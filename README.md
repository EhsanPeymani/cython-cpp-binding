# cython-cpp-binding
Sometimes it is need to call c/c++ directly from Python. This repository is a test repo for Python binding to call c++ using `Cython`. 

There are other solutions for example `ctypes`, `CFFI`, `PyBind11` and `Boost::python`. But `Cython` gaurantees the best performance. (see https://www.youtube.com/watch?v=rB7c69Z5Kus&t=1079s&ab_channel=CppCon)

## Platform
I am using `Linux Ubuntu 24.04`. 
But you should be able to adjust it to Windows.

## C++ Code
I used a simple set of C++ code. I use `cmake` amd `ninja`. 

To compile: 
```
mkdir build
cd build
cmake .. -G Ninja
ninja
```

It should create `libs` library in the root inclusing shared library `.so` file and headers `.h`.

The code includes 2 simple function files and one class to cover the main data types and data marshalling between c++ and python.

## Use C++ in Python
The `cython` files are located in `example` folder. 

It includes `my_cpp_lib` which is the python module, `setup.py` which compiles `cython` and `main.py` which use the c++ code in python. 

## `my_cpp_lib`
This folder includes the `cython` files. 

`.pxd` is the cython decleration file, similar to headers in c++.
`.pyx` is the cython implementation file, which will be called from `setup.py`. It needs a reference to `.pxd` file. 

The `.pyx` file can include the decleration as well, e.g. `version_wrapper.pyx`

`.pyi` is the python interface file and is used for type hinting. It is not used for compilation. 

## Compile Cython
To compile:
```
python setup.py build_ext --inplace
```
