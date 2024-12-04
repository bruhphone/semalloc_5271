#include <iostream>

int main() {
    std::cout << "\nHello World Malloc before return test\n";

    int* x = (int*) malloc(sizeof(int));
    int* y = x;
    *x = 21;
    std::cout << "\nThe magic number is: " << *x << "\n";
    free(x);
    
    return 0;
    
}