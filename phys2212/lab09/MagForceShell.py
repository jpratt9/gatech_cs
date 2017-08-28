from __future__ import division
from visual import *

## INITIAL VALUE OF B
B0 = vector(0,0.2,0)

## THIS CODE DRAWS A FLOOR AND DISPLAYS THE MAGNETIC FIELD *************
xmax = .4
dx = .1
yg = -.1
for x in arange(-xmax, xmax+dx, dx):
    curve(pos=[(x,yg,-xmax),(x,yg,xmax)], color=(.7,.7,.7))
for z in arange(-xmax, xmax+dx, dx):
    curve(pos=[(-xmax,yg,z),(xmax,yg,z)],color=(.7,.7,.7))
bscale = 1
for x in arange(-xmax, xmax+dx, 2*dx):
    for z in arange(-xmax, xmax+dx, 2*dx):
        arrow(pos=(x,yg,z), axis=B0*bscale, color=(0,.8,.8))
        
## YOUR PROGRAM BEGINS HERE ##*******************************************
        
## constants
oofpez = 9e9
qproton = -1.6e-19
mproton = 1.67e-27
##scalefactor = 
distance = 3e-10
velocity = vector(-2e6,0,0)
momentum = mproton*velocity

## objects
particle = sphere(pos=vector(0, 0.15, 0.3), radius=2e-2, color = color.blue)
trail = curve(color=particle.color)

deltat = 1e-11
t = 0
while 1:
    ## Insert the necessary steps inside the loop below to update the particle's position and velocity
    ## a) Add code to calculate the needed quantities to update the particle's velocity
    ## b) Add code to update the particle's velocity
    ## c) Update the position of the proton (movies in a straight line initially).
    rate(1000)
    t=t+deltat
    momentum = momentum + qproton*cross(velocity,B0)*deltat
    velocity = momentum/mproton
    particle.pos = particle.pos + velocity*deltat
    trail.append(pos=particle.pos)
