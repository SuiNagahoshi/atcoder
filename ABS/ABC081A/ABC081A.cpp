#include <iostream>
#include <string>
#include <vector>

int main() {
    std::string input;
    std::cin >> input;

    std::vector<char> split(input.begin(), input.end());

    int sum = 0;
    for (char s : split) {
        if (s == '1') sum++;
    }

    std::cout << sum << std::endl;

    return 0;
}