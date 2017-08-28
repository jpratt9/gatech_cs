from __future__ import division
from visual import *
scene.width = 1024
scene.height = 768
scene.x = scene.y = 0

# constants
oofpez = 9e9
L = 9
Q = 3e-10
N = 10
scalefactor = 1.0
dz = L/N
dQ = Q/N
R = .5

# list of charges
list_of_charges = []
z = -L/2 + dz/2
while z < L/2:
    list_of_charges.append(sphere(pos=(0,0,z), radius=.1, color=color.green))
    z = z+dz
print(len(list_of_charges))  ## print number of items in list

## uncomment these two lines to make program wait for a mouse click:
##print 'Click anywhere to continue'
##scene.mouse.getclick()  ## wait for a mouse click, then continue

# list of arrows; tail of each arrow is at an observation location
dzz = ((10/8)*L)/10
list_of_arrows = []
for z in arange(-5*L/8, 5*L/8+.001, dzz):
    for theta in arange(0,2*pi, pi/4):
        list_of_arrows.append(arrow(pos=(R*cos(theta), R*sin(theta),z),
                                    axis=(0,1,0)))
        
## uncomment these two lines to make program wait for a mouse click:
##print('Click anywhere to continue')
##scene.mouse.getclick()   ## wait for a mouse click, then continue

###############################################################
## calculation of field: you need to complete this block of statements

for thisarrow in (list_of_arrows):  ## take arrows one at a time
    rate(10)
   
    # you need to add statements to do the following things
    # (a) set Enet (the field at tail of thisarrow) to a zero vector here
    Enet = vector(0,0,0)
    # (b) add indented statement to loop over list of charges
    for thischarge in list_of_charges: 
        # (c) add necessary program statements to calculate dE, the
        #   field due to the current charge, at the observation location (tail of arrow)
        dE = oofpez*dQ*(thisarrow.pos-thischarge.pos)/(mag(thisarrow.pos-thischarge.pos)**3)
        
        # (d) add dE to Enet at this observation location
        Enet = Enet + dE
        # (e) after this code is added, uncomment the following two statements to display Enet
        thisarrow.axis = Enet*scalefactor
        thisarrow.color = color.magenta

