---
title: PQ-Students 
---

[Download Zip](https://github.gatech.edu/cs1331-fall2015/pq-students/archive/master.zip)

## Intro
Write some classes to make handling and processing students and their grades easier.

## Requirements

### Course
In the ``src/main/java`` directory create a Java source file to hold the definition of a public class named ``Course``, which represents a particular student's enrollment in a course. Implement the following constructors and methods in ``Course``:

- a constructor that takes in a `String` parameter, an `int` parameter,  and another `int` parameter.
    - The first is the name of the course and should be stored in an instance variable.
    - The second is the number of credits that this course is worth and should be stored in an instance variable. Negative values are not valid, but you do not need to check for these (we will not use such values in grading).
    - The third is the letter grade in this course and should be stored in an instance variable. Letter grades are stored as their GPA-equivalent numbers (i.e., A=4, B=3, C=2, D=1, F=0). Negative values and values >4 are invalid, but you do not need to check for these (we will not use such values in grading).
- `public int getCredits()` which returns the number of credits this course is worth.
- `public int getGrade()` which returns the grade in this course as its GPA-equivalent (see above).
- `public String toString()` which returns a `String` representation of a `Course` object in the form `[name]: [grade]`. For example, `new Course("CS 1331", 3, 4).toString()` would return `CS 1331: 4`

> Note that a Course object represents a particular student enrolled in a course.
Therefore there may be more than one course object with the same `name` String,
because each object represents a different student enrolled in that class.
(There is a slightly more elegant way to do this, but we don't have time for a
better solution on a time-limited quiz, so we're doing it the faster way
instead today.)

### Student 
In the ``src/main/java`` directory create a Java source file to hold the definition of a public class called ``Student``. Implement the following constructors and methods in `Student`:

- a constructor that takes in a `String` parameter and a `Course[]` parameter.
    - The first is the name of the student and should be stored in an instance variable.
    - The second is an array of courses this student is enrolled in, and should be stored in an instance variable.
- `public int getCredits()` which should return the total number of credits for which this student is enrolled, in other words, the sum of credits for this student's courses. (You do not need to worry about integer overflow in this case; we will not register any students for that many credits!!)
- `public String toString()` which returns a `String` representation of a `Student` object in the form:

        [name] is taking [num] courses:
        [name]: [grade]
        [name]: [grade]
        ...repeat lines for however many courses the student has.

    For example, `bob.toString()` would return something like:

        Bob is taking 2 courses:
        CS 1331: 4
        ENGL 1101: 3

    Note that you can leverage the `toString()` method of the `Course` class in your implementation of `toString()` on the `Student` class!

- `public double getGPA()` which should return the student's GPA. Recall that the GPA is calculated as a weighted average of the GPA-equivalent grade in each course, weighted by the number of credits in that course. So the score for a B (3) in a 2-hour course is `3*2 = 6`. Or the score for an A (4) in a 3-hour course is `4*3 = 12`. The GPA is the weighted scores of all classes divided by the credits of all classes. Since these two courses are worth 5 credits total, the GPA for a student with these courses and grades would be: `(6 + 12) / (2 + 3) = 18/5 = 3.6` __This method is a little more challenging, so we recommend you start the quiz by creating an empty implementation (`return 0.0`) and come back to fill in the implementation of this method correctly after you have everything else working properly.__

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final grade. If this completes without a compilation failure, proceed to submit with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**


### Tips:
- Stub out the required constructors and methods in your classes with dummy return values so that it (just barely!) compiles successfully and then go ahead and submit. This will get you *some* points and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last run, then `sbt submit`
- Look at the test code in `src/test/java` to see how your class is used.

