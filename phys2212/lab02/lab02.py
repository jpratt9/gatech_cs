from __future__ import division
from visual import *

## constants
oofpez = 9e9
qproton = -1.6e-19
scalefactor = 0.5*1.8190321946e-20
distance = 3e-10

## objects
particle = sphere(pos=vector(1e-10,0,0),radius=2e-11,color = color.blue)

## initial values
obslocation = vector(3.1e-10, -2.1e-10,0)

r = obslocation-particle.pos
print "relative position vector is", r
ra = arrow(pos=particle.pos,axis=r,color=color.green)

rmag = sqrt(r.x**2 + r.y**2 + r.z**2)
print "magnitude of r is", rmag

rhat = r/rmag
print "unit vector rhat is", rhat

E = oofpez*qproton*rhat/(rmag**2)
print "Electric field vector is", E

ea = arrow(pos=obslocation,axis=E*scalefactor,color=color.orange)

#print "ratio of r to E", rmag/sqrt(E.x**2+E.y**2+E.z**2)

obslocation1 = particle.pos + 3.1e-10 * vector(1,0,0)
obslocation2 = particle.pos + 3.1e-10 * vector(-1,0,0)
obslocation3 = particle.pos + 3.1e-10 * vector(0,1,0)
obslocation4 = particle.pos + 3.1e-10 * vector(0,-1,0)
obslocation5 = particle.pos + 3.1e-10 * vector(0,0,1)
obslocation6 = particle.pos + 3.1e-10 * vector(0,0,-1)

r1 = obslocation1 - particle.pos
r2 = obslocation2 - particle.pos
r3 = obslocation3 - particle.pos
r4 = obslocation4 - particle.pos
r5 = obslocation5 - particle.pos
r6 = obslocation6 - particle.pos

rmag1 = sqrt(r1.x**2 + r1.y**2 + r1.z**2)
rmag2 = sqrt(r2.x**2 + r2.y**2 + r2.z**2)
rmag3 = sqrt(r3.x**2 + r3.y**2 + r3.z**2)
rmag4 = sqrt(r4.x**2 + r4.y**2 + r4.z**2)
rmag5 = sqrt(r5.x**2 + r5.y**2 + r5.z**2)
rmag6 = sqrt(r6.x**2 + r6.y**2 + r6.z**2)

rhat1 = r1/rmag1
rhat2 = r2/rmag2
rhat3 = r3/rmag3
rhat4 = r4/rmag4
rhat5 = r5/rmag5
rhat6 = r6/rmag6

E1 = oofpez*qproton*rhat1/(rmag1**2)
E2 = oofpez*qproton*rhat2/(rmag2**2)
E3 = oofpez*qproton*rhat3/(rmag3**2)
E4 = oofpez*qproton*rhat4/(rmag4**2)
E5 = oofpez*qproton*rhat5/(rmag5**2)
E6 = oofpez*qproton*rhat6/(rmag6**2)

ea1 = arrow(pos=obslocation1,axis=E1*scalefactor,color=color.orange)
ea2 = arrow(pos=obslocation2,axis=E2*scalefactor,color=color.orange)
ea3 = arrow(pos=obslocation3,axis=E3*scalefactor,color=color.orange)
ea4 = arrow(pos=obslocation4,axis=E4*scalefactor,color=color.orange)
ea5 = arrow(pos=obslocation5,axis=E5*scalefactor,color=color.orange)
ea6 = arrow(pos=obslocation6,axis=E6*scalefactor,color=color.orange)

label(pos=(r/2)+particle.pos,text="r")
label(pos=(E/2)*scalefactor+obslocation,text="E")
