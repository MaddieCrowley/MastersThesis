# This file handles building each task as sub-project.
#
# Each task becomes an independent project in which you can experiment.
#
# Tasks are added as separate sub-projects so as compilation errors in
# one task don't affect another task.

cmake_minimum_required(VERSION 4.0)
project(MastersThesis)

set(CMAKE_CXX_STANDARD 17)

add_executable(
        FILTER
        main.cpp
        filter.cpp
        filter.h
)
