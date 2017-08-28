# ArrayStats Programming Quiz

1. Download the zip file of this repository using the button on the right.

2. Unzip the zip file.

3. ``cd`` to the unzipped directory on the command line.

4. Make a Java source file containing the definition of a public class named ``ArrayStats``.

5. In your ``ArrayStats`` class implement the following methods:

  - ``public static int range(int[] nums)`` should return a ``int`` value which is the difference between the least and greatest element in ``nums``.
  - ``public static int mode(int[] nums)`` should return a ``int`` value which is the most frequently occuring element value in ``nums``.
  - ``public static int mean(int[] nums)`` should return a ``int`` value which is the arithmetic mean of the values in ``nums``, given by $\mu = \frac{1}{n}\sum_{i}^{n}nums_i$ where $n$ is the size of ``nums``. Note that the preceding definition uses mathematical indexing (e.g., first value is index 1), not Java's indexing.
  - ``public static int median(int[] nums)`` should return a ``int`` value which is the value of the middle element of a sorted version of ``nums`` when the size of ``nums`` is odd, or the smaller of the middle two elements of a sorted version of ``nums`` if the size of ``nums`` is even. For this method you may want to use the ``Arrays`` class from the ``java.util`` package in the standard library.

When you finish submit your solution by entering the following command on the command line:

```
sbt submit
```

You may submit your solution as many times as you like. The last submission before the deadline will be graded.
