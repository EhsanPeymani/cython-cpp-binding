# distutils: language = c++
# cython: language_level = 3
# Remember that you do not need such directive since it is already part of the library # distutils: sources = "rectangle.cpp"

from . cimport rectangle_wrapper

cdef class PyRectangle:
    cdef rectangle_wrapper.Rectangle c_rect  # Hold a C++ instance which we're wrapping

    def __init__(self, int x0, int y0, int x1, int y1):
        self.c_rect = rectangle_wrapper.Rectangle(x0, y0, x1, y1)
    

    def get_area(self):
        return self.c_rect.getArea()
    
    def get_size(self):
        cdef int width, height
        self.c_rect.getSize(&width, &height)
        return width, height

    def move(self, dx, dy):
        self.c_rect.move(dx, dy)
    
    # Attribute access
    @property
    def x0(self):
        return self.c_rect.x0
    @x0.setter
    def x0(self, x0):
        self.c_rect.x0 = x0

    # Attribute access
    @property
    def x1(self):
        return self.c_rect.x1
    @x1.setter
    def x1(self, x1):
        self.c_rect.x1 = x1

    # Attribute access
    @property
    def y0(self):
        return self.c_rect.y0
    @y0.setter
    def y0(self, y0):
        self.c_rect.y0 = y0

    # Attribute access
    @property
    def y1(self):
        return self.c_rect.y1
    @y1.setter
    def y1(self, y1):
        self.c_rect.y1 = y1