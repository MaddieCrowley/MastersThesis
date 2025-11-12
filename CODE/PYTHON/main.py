import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

import matplotlib.pyplot as plt

data = np.zeros(100)

#####################################
# async def genClk(dut):            #
#     for _ in range(100):          #
#         dut.clk.value = 0         #
#         await Timer(1, unit="ns") #
#         dut.clk.value = 1         #
#         await Timer(1, unit="ns") #
#####################################



@cocotb.test()
async def filter(dut):
    c = Clock(dut.clk,10,"ns")
    c.start()
    data_thread = cocotb.start_soon(getData(dut, 100))
    reset_thread = cocotb.start_soon(setReset(dut))
    dut.tuning_word.value = 10
    await reset_thread
    await data_thread
    plot(data)
    

    
async def getData(dut,clock_cycles):
    i=0
    for i in range(clock_cycles):
        await RisingEdge(dut.clk)
        data[i] = dut.n_RST.value
        cocotb.log.info(data[i])


async def setReset(dut):
    await Timer(50,unit="ns")
    dut.n_RST.value = 1
    #cocotb.log.info(dut.n_RST.value)
    await Timer(50,unit="ns")
    dut.n_RST.value = 0
    await Timer(50,unit="ns")
    dut.n_RST.value = 1
    #cocotb.log.info(dut.n_RST.value)

def plot(dat):
    ax = plt.figure()
    plt.plot(range(dat.size),dat)
    plt.show()
#print(cycles)
