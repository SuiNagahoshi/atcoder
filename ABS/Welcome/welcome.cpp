#include <iostream>
#include <string>

int main() {
    int a, b, c;
    std::string s;
    std::cin >> a >> b >> c >> s;
    int add = a + b + c;
    std::cout << add << " " << s << std::endl;

    return 0;
}