from __future__ import division
from visual import *
#constants
scaleFactor = 2e-21
oofpez = 9e9
qproton = 1.6e-19
qelectron = -1.6e-19
#objects
positive = sphere(pos=vector(-5e-11,0,0),radius=1e-11,color = color.red)
negative = sphere(pos=vector(5e-11,0,0),radius=1e-11,color = color.blue)
#initial values
obslocation = vector(2e-10,0,0)
#calculations
theta = 0
while theta<(2*pi):
    obslocation = 2e-10*vector(cos(theta),sin(theta),0)
    rpos = obslocation - positive.pos
    rneg = obslocation - negative.pos

    Epos = (oofpez*qproton*rpos)/(mag(rpos)**3)
    Eneg = (oofpez*qelectron*rneg)/(mag(rneg)**3)
    E = Epos+Eneg
    print "net field at obslocation", E
    ea = arrow(pos=obslocation,axis=E*scaleFactor,color=color.orange)
    theta = theta + pi/6

theta = 0
while theta<(2*pi):
    obslocation = 2e-10*vector(cos(theta),0,sin(theta))
    rpos = obslocation - positive.pos
    rneg = obslocation - negative.pos

    Epos = (oofpez*qproton*rpos)/(mag(rpos)**3)
    Eneg = (oofpez*qelectron*rneg)/(mag(rneg)**3)
    E = Epos+Eneg
    print "net field at obslocation", E
    ea = arrow(pos=obslocation,axis=E*scaleFactor,color=color.orange)
    theta = theta + pi/6

theta1 = 0

r1 = 2e-10
r2 = 4e-10

obslocation1 = r1*vector(cos(theta1),sin(theta1),0)
obslocation2 = r2*vector(cos(theta1),sin(theta1),0)

rpos1 = obslocation1 - positive.pos
rpos2 = obslocation2 - positive.pos

rneg1 = obslocation1 - negative.pos
rneg2 = obslocation2 - negative.pos

Epos1 = (oofpez*qproton*rpos1)/(mag(rpos1)**3)
Epos2 = (oofpez*qproton*rpos2)/(mag(rpos2)**3)

Eneg1 = (oofpez*qelectron*rneg1)/(mag(rneg1)**3)
Eneg2 = (oofpez*qelectron*rneg2)/(mag(rneg2)**3)

E1 = Epos1+Eneg1
E2 = Epos2+Eneg2
print "ratio of E values along axis", mag(E1)/mag(E2)

theta1 = pi/2

r1 = 2e-10
r2 = 4e-10

obslocation1 = r1*vector(cos(theta1),sin(theta1),0)
obslocation2 = r2*vector(cos(theta1),sin(theta1),0)

rpos1 = obslocation1 - positive.pos
rpos2 = obslocation2 - positive.pos

rneg1 = obslocation1 - negative.pos
rneg2 = obslocation2 - negative.pos

Epos1 = (oofpez*qproton*rpos1)/(mag(rpos1)**3)
Epos2 = (oofpez*qproton*rpos2)/(mag(rpos2)**3)

Eneg1 = (oofpez*qelectron*rneg1)/(mag(rneg1)**3)
Eneg2 = (oofpez*qelectron*rneg2)/(mag(rneg2)**3)

E1 = Epos1+Eneg1
E2 = Epos2+Eneg2
print "ratio of E values along perpendicular axis", mag(E1)/mag(E2)

theta1 = pi/3

r1 = 2e-10
r2 = 4e-10

obslocation1 = r1*vector(cos(theta1),sin(theta1),0)
obslocation2 = r2*vector(cos(theta1),sin(theta1),0)

rpos1 = obslocation1 - positive.pos
rpos2 = obslocation2 - positive.pos

rneg1 = obslocation1 - negative.pos
rneg2 = obslocation2 - negative.pos

Epos1 = (oofpez*qproton*rpos1)/(mag(rpos1)**3)
Epos2 = (oofpez*qproton*rpos2)/(mag(rpos2)**3)

Eneg1 = (oofpez*qelectron*rneg1)/(mag(rneg1)**3)
Eneg2 = (oofpez*qelectron*rneg2)/(mag(rneg2)**3)

E1 = Epos1+Eneg1
E2 = Epos2+Eneg2
print "ratio of E values not along an axis", mag(E1)/mag(E2)
