#include <iostream>
#include "sum.h"
#include "version.h"
#include "shapes/rectangle.h"

int main() {
    float num1 = 3.5, num2 = 4.5;

    std::cout << "c++ code - Sum of " << num1 << " and " << num2 << " is: " << sum(num1, num2) << std::endl;
    std::cout << "c++ code - Multiplication of " << num1 << " and " << num2 << " is: " << multiply(num1, num2) << std::endl;
    std::cout << "version: " << get_version() << std::endl;
    std::cout << "name: " << get_name() << std::endl;

    std::cout << "System Name: " << get_system_name() << std::endl;
    std::cout << "System Version: " << get_system_version() << std::endl;

    shapes::Rectangle rect(0, 0, 5, 5);
    auto area = rect.getArea();
    std::cout << "Area: " << area << std::endl;


    return 0;
}
