
from __future__ import division
from visual import *

baseball = sphere(pos=vector(-5,2,-3), radius=0.40, color=color.red)
tennisball = sphere(pos=vector(-3,-1,0), radius=0.15, color=color.green)
bt = arrow(pos=baseball.pos, axis=tennisball.pos-baseball.pos, color=color.cyan)

print(tennisball.pos)
print(tennisball.pos - baseball.pos)


t = 0
while t<10:
    t = t+0.5
    print(t)

print("End of program")

theta = 0
while theta<=2*pi:
    print(theta)
    theta = theta + pi/5
