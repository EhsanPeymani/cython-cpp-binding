from my_cpp_lib.sum_wrapper import py_sum, py_multiply, py_get_version, py_get_name
from my_cpp_lib.version_wrapper import py_get_system_name, py_get_system_version
from my_cpp_lib import PyRectangle


def main():
    x, y = 14.5, 20
    result = py_sum(x, y)
    print(f"Sum of {x} and {y} is: {result}")
    
    x, y = 4, 5
    result = py_multiply(x, y)
    print(f"{x} * {y} = {result}")
    
    print(f"Version: {py_get_version()}")
    print(f"Name: {py_get_name()}")
    
    print(f"System Name: {py_get_system_name()}, System Ver: {py_get_system_version()}")
    
    rect = PyRectangle(0, 0, 4, 8)
    print(f"Area is {rect.get_area()}")


if __name__ == "__main__":
    main()