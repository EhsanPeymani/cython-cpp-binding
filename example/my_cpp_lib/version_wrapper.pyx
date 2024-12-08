# distutils: language = c++
# cython: language_level = 3

from libcpp.string cimport string

cdef extern from "version.h":
    string get_system_name();
    string get_system_version();

def py_get_system_version():
    return get_system_version().decode()

def py_get_system_name():
    return get_system_name().decode()