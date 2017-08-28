# Peoplebase Programming Quiz

In this programming quiz you will write a class to represent persons, and a class that implements a simple database for people.

1. Download the zip file of this repository using the button on the right to the directory on your disk where you keep your CS 1331 course work.

2. Unzip the zip archive and navigate to the directory created by unzipping the archive at the command line. You should see a ``build.sbt`` file in this directory. This is the *project root*.

3. Create a directory named ``src/main/java``.

4. In the ``src/main/java`` directory create Java source file to hold the definition of a public class named ``Person``.

5. Implement the following constructors and methods in ``Person``:

  - a constructor that takes two ``String`` parameters.
    - The first parameter is the name of the person and should be stored in an instance variable.
    - The second parameter is the hometown of the person and should be stored in an instance variable.
  - ``public String toString()`` returns a ``String`` representation of a ``Person`` object in the form ``<name> from <homeTown>``. For example, ``new Person("Bob", "Baltimore").toString()`` would return ``Bob from Baltimore``.
  - ``public String getName()`` returns the name of this person.
  - ``public String getHomeTown()`` returns the home town of this person.

6. In the ``src/main/java`` directory create Java source file to hold the definition of a public class named ``Peoplebase``.

7. Implement the following constructors and methods in ``Peoplebase``:

  - a constructor that takes a variable number of single ``Person`` parameters. The ``Person`` objects passed as arguments to the constructor should be stored in an array instance variable.
  - ``public Person findByName(String name)`` returns the first ``Person`` instance stored in the array instance variable whose name matches ``name``.
  - ``public Person findByHomeTown(String homeTown)`` returns the first ``Person`` instance stored in the array instance variable whose home town matches ``homeTown``.

8. Submit your solution by running ``sbt submit`` in the project root directory.

Tips:

- Create your ``Person`` and ``Peoplebase`` classes and stub out all the required contructors and methods with dummy return values.
- Run ``sbt checkstyle``, ``sbt test``, and ``sbt grade`` to get a report of style errors, test failures, and a final grade report of your current progress. If each of these three commands completes successfully, run ``sbt submit``.
- As you add functionality, rerun the previous step and re-submit if your grade is improved.
- Look at the test code in ``src/test/java`` to see how your class is used.
