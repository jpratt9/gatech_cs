asdf
# Arithmetic Sequence Programming Quiz

An arithmetic sequence is a sequence of numbers with a first term and a constant difference between each consecutive term. [Wikipedia](https://en.wikipedia.org/wiki/Arithmetic_progression)

In this programming quiz you will write a class to represent arithmetic sequences.

1. Download the zip file of this repository using the button on the right to the directory on your disk where you keep your CS 1331 course work.

2. Unzip the zip archive and navigate to the directory created by unzipping the archive at the command line. You should see a ``build.sbt`` file in this directory. This directory is the *project root*.

3. Create a directory named ``src/main/java``.

4. In the ``src/main/java`` directory create a Java source file to hold the definition of a public class named ``ArithmeticSequence``.

5. Implement the following constructors and methods in ``ArithmeticSequence``:

  - a constructor that takes two ``int`` parameters.
    - The first parameter is the first term of the sequence and should be stored in an instance variable.
    - The second parameter is the common difference between terms in the sequence and should be stored in an instance variable.
  - ``public int getFirstTerm()`` returns the first term of this sequence.
  - ``public int getDifference()`` returns the common difference of this sequence.
  - ``public int nth(int n)`` returns term ``n`` of the sequence, e.g., for the sequence (1, 3, 5, 7, 9, ...) ``nth(5)`` should return ``9`` (note math indexing).
  - ``public int[] subsequence(int n, int m)`` returns the subsequence from term ``n`` to term ``m``, inclusive. For example, for the sequence (1, 3, 5, 7, 9, 11, ...) ``subsequence(3, 6)`` should return ``{5, 7, 9, 11}``.
  - ``public int sumTo(int nth)`` returns the sum of the terms up to the ``nth`` term of the sequence, inclusive. The sum of the first n terms of a sequence is given by $\frac{n(a_1 + a_n)}{2}$ where $a_1$ is the first term and $a_n$ is the $n$th term.

6. Submit your solution by running ``sbt submit`` in the project root.

Tips:

- Create your ``ArithmeticSequence`` class, stub all the methods above with dummy return values, compile with ``sbt compile`` and submit. You'll already have significant partial credit for a small amount of work.
- Run ``sbt test`` to get a report of incorrectly implemented methods in your class.
- Look at the test code in ``src/test/java`` to see how your class is used.
