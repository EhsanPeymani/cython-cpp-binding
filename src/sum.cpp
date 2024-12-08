#include "sum.h"
#include <string>

// Function definition for summing two floats
float sum(float a, float b) {
    return a + b;
}

float multiply(float a, float b) {
    return a * b;
}

const char* get_version() {
    static std::string version = "1.2.3";  // static keeps the string alive
    return version.c_str();                // return C-style string
}

std::string get_name() {
    return "My C++ Application";
}