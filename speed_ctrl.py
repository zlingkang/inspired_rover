#!/usr/bin/python2

from Tkinter import *
import tkMessageBox
import serial

top = Tk()

try:
    robot_ser = serial.Serial('/dev/ttyACM0', 9600)
except:
    print "Cannot connect to the robot"

l_speed = 0
l_dir = 1
Label(text = "l_speed", width = 10).grid(row = 0, column = 0)
scale_l = Scale(l_speed, orient = HORIZONTAL, length = 500, from_ = -255, to = 250)
scale_l.set(1000)
scale_l.grid(row = 0, column = 1)

r_speed = 0
r_dir = 1
Label(text = "r_speed", width = 10).grid(row = 1, column = 0)
scale_r = Scale(r_speed, orient = HORIZONTAL, length = 500, from_ = -255, to = 250)
scale_r.set(1000)
scale_r.grid(row = 1, column = 1)

def task():
    l_speed = scale_l.get()
    r_speed = scale_r.get()
    if l_speed < 0:
        l_speed = -l_speed
        l_dir = 0
    else:
        l_dir = 1
    if r_speed < 0:
        r_speed = -r_speed
        r_dir = 0
    else:
        r_dir = 1
    command = str(255) + ',' + str(l_dir) + ',' + str(l_speed) + ',' + str(r_dir) + ',' + str(r_speed) + 'e'
    robot_ser.write(command)
    try:
        robot_ser.inWaiting()
    except:
        print "Lost connection"
    top.after(100, task)

top.after(100, task)
top.mainloop()
