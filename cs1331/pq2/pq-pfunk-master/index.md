---
Pfunk Programming Quiz
---

[Download Zip](https://github.gatech.edu/cs1331-{semester}/{pq-name}/archive/master.zip)

## Intro

In this programming quiz you will apply principles of subtype polymorphism to the redesign of a family of classes and extend this family using your new polymorphic design.

## Problem Description

It's 2008 and the Atomic Dog, Professor Charles Isbell, has just graduated his first PhD. Until now, all members of Charles's research group, pfunk, were classified as:

- **Lollypop**: undergraduate, or
- **Clone**: moved beyond the Ph.D. qualifer

Now he needs a new classification:

- **Pyramid**: learned the secrets of the funk and earned a Ph.D.

But Charles has another problem: the existing code representing these classifications was written hastily by an overworked graduate student. So before adding the new classification, Charles would like you to refactor the existing classes using the object-oriented programming skills you've learned in CS 1331.

## Solution Description

1. Create an abstract class called ``Pfunker`` which will be the base class for all of the classes that represent pfunk member classifications.
2. Modify each of the existing Pfunk member classes listed above so that they extend ``Pfunker``.
3. Each of the existing Pfunk member classes has a ``name`` field and a ``getName()`` method. Move these methods from the subclasses into the ``Pfunker`` superclass so that there is a single definition shared by all ``Pfunker`` subclasses.
4. Each of the existing Pfunk member classes has an ``accomplishTask(String task)`` method that returns a string describing how a member of that type would accompish a task. Make this method polymorphic so that you could have a reference variable of type ``Pfunker`` that references an object of type ``Lollypop``, ``Clone``, or ``Pyramid`` and you could invoke the ``accomplishTask(String task)`` on that object. There is a commented-out section of ``Pfunk`` in ``src/main/java`` that shows how this might work.
  - There is no general definition for the ``accomplishTask(String task)`` in ``Pfunker``. Use the appropriate Java language feature to express this fact.
5. Add a new class, ``Pyramid`` which extends ``Pfunker``. ``Pyramid``'s ``accomplishTask(String task)`` method should return a String of the form:
  - ``<name> will <task> by delegating to graduate students.``

After refactoring the existing classes, adding `Pfunker` and `Pyramid`, your classes will have the following relationship:

<img src='http://g.gravizo.com/g?
abstract class Pfunker {}
class Lollypop extends Pfunker {}
class Clone extends Pfunker {}
class Pyramid extends Pfunker {}
'>

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final grade. If this completes without a compilation failure, proceed to submit with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**


### Tips:
- Stub out the required constructors and methods in your classes with dummy return values and then go ahead and submit. This will get you *some* points and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last run, then `sbt submit`
- You can use ``sbt run`` to run ``Pfunk``. Keep in mind the code in this class is commented out initially.
- Look at the test code in `src/test/java` to see how your class is used.

See http://www.cc.gatech.edu/~isbell/iai/people.shtml for the background of this PQ.
