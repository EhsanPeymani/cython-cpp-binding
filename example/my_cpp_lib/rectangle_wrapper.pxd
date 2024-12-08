cdef extern from "rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        int x0, y0, x1, y1
        Rectangle() except +
        Rectangle(int x0, int y0, int x1, int y1) except +
        int getArea()
        void getSize(int* width, int* height)
        void move(int dx, int dy)