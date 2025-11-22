//
// Created by madeline on 11/15/25.
//

#ifndef MASTERSTHESIS_FILTER_H
#define MASTERSTHESIS_FILTER_H
#include <vector>


class filter {
public:
    explicit filter(std::vector<float> input);
    ~filter();
private:
    std::vector<float>reg;

    std::vector<float> sah(std::vector<bool> sah_mask);
    void zneg1();
    void sum();
};


#endif //MASTERSTHESIS_FILTER_H