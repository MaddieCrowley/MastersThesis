//
// Created by madeline on 11/15/25.
//

#include "filter.h"

filter::filter(std::vector<float>input):reg(std::move(input)) {
}

filter::~filter() {
    delete &reg;
}

std::vector<float> filter::sah(std::vector<bool> sah_mask) {
    float tmp=0;
    std::vector<float> sah_reg;
    for (int i = 0; i < reg.size(); i++) {
        if (sah_mask[i]) {
            tmp = reg[i];
        }
        else {
            sah_reg[i] = tmp;
        }
    }
}

void filter::zneg1() {
    for (int i = 1; i < reg.size(); i++) {
        reg[i] = reg[i-1];
    }
}


void filter::sum() {
}
