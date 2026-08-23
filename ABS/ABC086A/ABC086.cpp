#include <iostream>

int main() {
    int a, b;
    std::cin >> a >> b;
    int mul = a * b;

    std::cout << (mul & 1 ? "Odd" : "Even") << std::endl;

    return 0;
}