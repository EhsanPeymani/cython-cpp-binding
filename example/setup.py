from setuptools import Extension, setup, find_packages
from Cython.Build import cythonize

ext_modules = [
    Extension(
        "my_cpp_lib.sum_wrapper",
        ["my_cpp_lib/sum_wrapper.pyx"],
        libraries=["mathlib"],
        library_dirs=["../libs"],
        include_dirs=["../libs"],
        runtime_library_dirs=["../libs"],
        language="c++"
    ),
    Extension(
        "my_cpp_lib.version_wrapper",
        ["my_cpp_lib/version_wrapper.pyx"],
        libraries=["mathlib"],
        library_dirs=["../libs"],
        include_dirs=["../libs"],
        runtime_library_dirs=["../libs"],
        language="c++"
    ),
    Extension(
        "my_cpp_lib.rectangle_wrapper",
        ["my_cpp_lib/rectangle_wrapper.pyx"],
        libraries=["mathlib"],
        library_dirs=["../libs"],
        include_dirs=["../libs"],
        runtime_library_dirs=["../libs"],
        language="c++"
    )
]

setup(
    name="my_cpp_lib",
    packages=find_packages(),
    package_data={
        'my_cpp_lib': ['*.pyi'],  # Include type hints
    },
    ext_modules=cythonize(ext_modules),
    python_requires='>=3.6',
)
