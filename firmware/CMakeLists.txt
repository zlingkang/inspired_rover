set(CMAKE_TOOLCHAIN_FILE cmake/ArduinoToolchain.cmake)

cmake_minimum_required(VERSION 2.8)

project(inspired_rover C CXX)

#set(${ROS_LIB_DIR} /home/lethic/Arduino/libraries/ros_lib)

#include_directories(${ROS_LIB_DIR})

#MESSAGE( STATUS "ROS_LIB_DIR:         " ${ROS_LIB_DIR} )

link_directories(/home/autolab/Arduino/libraries)

# Remove this if using an Arduino without native USB (eg, other than Leonardo)
#add_definitions(-DUSB_CON)

generate_arduino_firmware(inspired_rover
    SRCS inspired_rover.cpp 
    BOARD leonardo
    PORT /dev/ttyACM0
    SERIAL picocom @SERIAL_PORT@ -b 9600 -l
)
