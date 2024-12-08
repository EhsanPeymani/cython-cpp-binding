If the class has nullary constructor such as 

```Rectangle::Rectangle() {}```

Cython can create and destroy instances as below

```
# rectangle.pxd
cdef extern from "rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle() except +
        Rectangle(int, int, int, int) except +
        int getArea()
        void getSize(int*, int*)
        void move(int, int)

# rectangle.pyx
cdef class PyRectangle:
    cdef Rectangle c_rect  # Direct instance
    
    def __init__(self, int x0=0, int y0=0, int x1=0, int y1=0):
        self.c_rect = Rectangle(x0, y0, x1, y1)

```
If there was no nullary constructor:
```
# In .pxd
cdef extern from "rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle(int, int, int, int)  # No nullary constructor
        int getArea()

# In .pyx
from Rectangle cimport Rectangle

cdef class PyRectangle:
    cdef Rectangle*c_rect  # hold a pointer to the C++ instance which we're wrapping

    def __cinit__(self):
        self.c_rect = new Rectangle()

    def __init__(self, int x0, int y0, int x1, int y1):
        self.c_rect.x0 = x0
        self.c_rect.y0 = y0
        self.c_rect.x1 = x1
        self.c_rect.y1 = y1

    def __dealloc__(self):
        del self.c_rect
```
When you use pointers, you have to manually cleanup at deconstruction. 

Alternatively, you can use `cpp_locals` as below, which seems safer not to have memory leak since mamory management is automatic. This approach looks cleaner as it includes direct assignment and there is no need for pointer sytax `->`. (**I have not tested this approach myself**)
```
# In .pxd
cdef extern from "rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle(int, int, int, int)  # No nullary constructor
        int getArea()

# In .pyx
# distutils: cpp_locals=True  # Enable cpp_locals directive

cdef class PyRectangle:
    cdef Rectangle c_rect  # Direct instance, not a pointer
    
    def __cinit__(self, int x0=0, int y0=0, int x1=0, int y1=0):
        self.c_rect = Rectangle(x0, y0, x1, y1)  # Direct assignment
    
    # No __dealloc__ needed - automatic cleanup
```
