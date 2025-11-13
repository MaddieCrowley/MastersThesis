import cocotb
from cocotb.triggers import Timer,Combine,First
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
import numpy as np

import matplotlib.pyplot as plt

# data = np.zeros(100)

#####################################
# async def genClk(dut):            #
#     for _ in range(100):          #
#         dut.clk.value = 0         #
#         await Timer(1, unit="ns") #
#         dut.clk.value = 1         #
#         await Timer(1, unit="ns") #
#####################################


# ORGANIZE THIS INTO FUNCTIONS

# USE A DDS INSIDE THE TB MODULE TO DO THE TESTING

@cocotb.test()
async def filter(dut,clk_cycles=10000):
    sigIn = np.zeros(clk_cycles)
    trig = np.zeros(clk_cycles)
    sigOut = np.zeros(clk_cycles)
    # dds_val = np.zeros(clk_cycles)
    # sah_val = np.zeros(clk_cycles)
    c = Clock(dut.clk,380,"ns")
    c.start()
    MAX_THREAD = cocotb.start_soon(MaxLength(dut,clk_cycles))
    dut.tuning_word.value = (2**14)-1
    # pa_thread = cocotb.start_soon(getData(dut.clk,dut.I_DDS.phase_value, 1000))
    # dds_thread = cocotb.start_soon(getData(dut.clk,dut.dds_out, clk_cycles,dds_val))
    # sah_trig = cocotb.start_soon(getData(dut.clk, dut.I_SAH.trig, clk_cycles,sah_val))
    
    sigIn_thread = cocotb.start_soon(signalIn(dut))
    data_thread = cocotb.start_soon(getData(dut.clk, dut.sig_in, sigIn))
    sah_thread = cocotb.start_soon(getData(dut.clk, dut.I_SAH.trig, trig))
    sigOut_thread = cocotb.start_soon(getData(dut.clk, dut.sah_out, sigOut))

    reset_thread = cocotb.start_soon(setReset(dut))
    await reset_thread
    await MAX_THREAD

    # await Combine (
    # #    pa_thread,
    #     dds_thread,
    # )

    # cocotb.log.info(dut.sig_in.value)

    zoom = clk_cycles
    ax = plt.figure()
    plt.subplot(3,1,1)
    plt.plot(range(clk_cycles)[:zoom],sigIn[:zoom])
    # plt.plot(range(dds_val.size),dds_val)
    plt.subplot(3,1,2)
    plt.plot(range(clk_cycles)[:zoom],sigOut[:zoom])
    # plt.plot(range(sah_val.size),sah_val)
    plt.subplot(3,1,3)
    plt.plot(range(clk_cycles)[:zoom],trig[:zoom])
   
    plt.show()
    # plot(RST_VAL)
    
async def signalIn(dut):
    i=0
    while True:
        
        await RisingEdge(dut.clk)
        if i >= 2**14:
            i=0
        else:
            i=i+2**10
        dut.sig_in.value = int(
            (2**16)*(.5*np.sin(i)+.5)
            # (2**16)*(.5*np.sin(1*2*np.pi*i/clock_cycles)+.5)
            # (2**16)*(.5*np.sin(1*2*np.pi*i/clock_cycles)+.5)
            
        )
        # cocotb.log.info(int(dut.sig_in.value))
        # cocotb.log.info(int((2**16)*(.5*np.sin(i/clock_cycles)+.5)))
    
    
async def getData(clk,sig,data):
    i=0
    # data = np.zeros(clock_cycles)
    # for i in range(clock_cycles):
    while True:
        await RisingEdge(clk)
        data[i] = int(sig.value)
        i=i+1
        # cocotb.log.info(data[i])
    # plot(data)
    # return data

async def setReset(dut):
    await RisingEdge(dut.clk)
    dut.n_RST.value = 1
    # cocotb.log.info(dut.n_RST.value)
    await RisingEdge(dut.clk)
    dut.n_RST.value = 0
    await RisingEdge(dut.clk)
    dut.n_RST.value = 1
    # cocotb.log.info(dut.n_RST.value)

async def MaxLength(dut,length):
    i = 0
    for i in range(length):
        await RisingEdge(dut.clk)
    
def plot(dat):
    plt.subplot()
    plt.plot(range(dat.size),dat)
    plt.show()
# print(cycles)
