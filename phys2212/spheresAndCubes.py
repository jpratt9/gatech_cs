from __future__ import division
from visual import *
# John Pratt
# PHYS2212 P01
ball1 = sphere( pos=vector(2.5,2.5,2.5),    radius=0.25, color=color.red )
ball2 = sphere( pos=vector(2.5,2.5,-2.5),   radius=0.25, color=color.red )
ball3 = sphere( pos=vector(2.5,-2.5,2.5),   radius=0.25, color=color.red )
ball4 = sphere( pos=vector(2.5,-2.5,-2.5),  radius=0.25, color=color.red )
ball5 = sphere( pos=vector(-2.5,2.5,2.5),   radius=0.25, color=color.red )
ball6 = sphere( pos=vector(-2.5,2.5,-2.5),  radius=0.25, color=color.red )
ball7 = sphere( pos=vector(-2.5,-2.5,2.5),  radius=0.25, color=color.red )
ball8 = sphere( pos=vector(-2.5,-2.5,-2.5), radius=0.25, color=color.red )

arrow( pos=ball1.pos, axis=ball2.pos-ball1.pos, color=color.blue )
arrow( pos=ball2.pos, axis=ball8.pos-ball2.pos, color=color.blue )
arrow( pos=ball8.pos, axis=ball7.pos-ball8.pos, color=color.blue )
arrow( pos=ball7.pos, axis=ball1.pos-ball7.pos, color=color.blue )

theta = 0
while theta < 2*pi:
    sphere( pos=vector(5*cos(theta),0,5*sin(theta)), radius=0.25, color=color.green )
    theta = theta + pi/6
