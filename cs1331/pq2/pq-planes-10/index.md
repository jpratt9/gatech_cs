---
Planes Programming Quiz
---

[Download Zip](https://github.gatech.edu/cs1331-fall2015/pq-planes/archive/10AM.zip)

## Intro

In this programming quiz you will apply principles of subtype polymorphism to
the redesign of a family of classes and extend this family using your new
polymorphic design.

## Problem Description

We've been simulating different planes to determine their range and horsepower,
that is, how far they can go on a full tank of fuel. We've explored some
different vehicles, including full powered jets and simple biplanes. 
Now we'd like to look at a new plane: a drone, but there's just one problem: It's
electric. (Boogie woogie woogie!) That means no fuel, and no fuel tank! 
Drones still have a range, based on a full battery charge, so we can do the same
operation (calculating range), but it will require an entirely different
implementation.

## Solution Description

1. Create an interface class called ``Plane`` which will be the interface for all
of the classes that represent planes.

2. Modify each of the existing plane classes listed above so that they implement
``Plane``.

4. Each of the existing plane classes has a ``double getRange()`` method that
returns a double describing how many miles that plane can travel on a full tank
of gas. Each also has a ``int getHorsepower()`` method that returns the plane's
horsepower. Make both these methods polymorphic so that you could have a
reference variable of type ``Plane`` that references an object of type ``Biplane``,
``Jet``, or ``Drone`` and you could invoke the ``double getRange()``
and ``int getHorsepower()`` methods on that object. There is a commented-out
section of ``Ranges`` in ``src/main/java`` that shows how this might work.

5. Add a new class, ``Drone`` which implements ``Plane``.

 - ``Drone`` should have a constructor that takes in an `int horsepower`
    and a `double range`. It should use these to set the value of corresponding 
    instance fields.

 - ``Drone``'s ``double getRange()`` method should return a double with
   the value that was passed into the constructor.

 - ``Drone``'s ``int getHorsepower()`` method should return an int with
   the value that was passed into the constructor. 


After refactoring the existing classes, adding `Plane` and `Drone`, your
classes will have the following relationship. Note that this only shows the
class/interface relationships; variables and methods are omitted from this
diagram.

![UML Diagram of classes Biplane, Jet, and Drone that each implement interface Plane](http://g.gravizo.com/g?
interface Plane {}
class Biplane implements Plane {}
class Jet implements Plane {}
class Drone implements Plane {}
)

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final
  grade. If this completes without a compilation failure, proceed to submit
  with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**


### Tips:
- Stub out the required constructors and methods in your classes with dummy
  return values and then go ahead and submit. This will get you *some* points
  and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last
  run, then `sbt submit`
- You can use ``sbt run`` to run ``Ranges``. Keep in mind the code in this
  class is commented out initially.
- Look at the test code in `src/test/java` to see how your class is used.

