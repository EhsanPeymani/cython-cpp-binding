# distutils: language = c++
# cython: language_level = 3

from . cimport sum_wrapper

def py_sum(x, y):
    return sum_wrapper.sum(x, y)

def py_multiply(x, y):
    return sum_wrapper.multiply(x, y)

def py_get_version():
    return sum_wrapper.get_version().decode("utf-8")

def py_get_name():
    return sum_wrapper.get_name().decode()