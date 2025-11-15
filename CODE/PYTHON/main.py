import numpy as np
import scipy as sp
import matplotlib.pylot as plt


def filter(input,clk,sah_trig):
    if clk==1:
        zneg1 = sum
        sum = input + sah
        if sah_trig==1:
            sah = zneg1
        else:
            sah = sah
        output = sum
    else: output = output
    return output

def main():
    for i in range(100):
        clk = TRUE
        input = 0.5*np.sin(2*np.pi*i)+0.5
        sah_trig = 

if __name__=="__main__":
    main()
