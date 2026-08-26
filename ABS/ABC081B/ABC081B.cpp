#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int N;
    std::cin >> N;

    std::vector<int> A(N);
    for (int i = 0; i < N; i++) {
        std::cin >> A[i];
    }

    int count = 0;

    while (std::all_of(A.begin(), A.end(), [](int n) { return n % 2 == 0;})) {
        std::transform(A.begin(), A.end(), A.begin() , [](int n) { return n/2; });
        count++;
    }

    std::cout << count << std::endl;

    return 0;
}