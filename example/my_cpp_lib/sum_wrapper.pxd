from libcpp.string cimport string

cdef extern from "sum.h":
    float sum(float a, float b)
    float multiply(float a, float b)
    const char* get_version()
    string get_name()
