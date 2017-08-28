---
title: Moon List
---

[Download Zip](https://github.gatech.edu/cs1331-fall2015/pq-moonlist/archive/master.zip)

## Intro
You will improve the implementaiton of a MoonList, a class the keeps a list of Moons in an array. In addition to the array iteself, it has a capacity (the number of spots in the array) and a size (the number of Moons actually in the array), thus allowing Moons to be added by incrementing size up to the capacity. (Adding more once capacity is reached is an error.) This functionality already exists - what you need to add to the MoonList is **sorting** and an **iterator**. All your changes will be in the `Moon.java` and `MoonList.java` files; the other source files are already complete and do not need to be modified.

## Problem Description
You have an array of `Moon` in the `MoonList` class. You already have code to construct a `MoonList` and to add a new Moon to it. Now you want to add ways to sort it and iterate through it.

1. `MoonList` has a `sortByName()` method already implemented that uses the natural ordering of `Moon` to sort the Moons alphabetically. However, `Moon` does not yet have a natural ordering. Make `Moon` implement the `Comparable` interface to give it a natural ordering. The natural ordering should be alphabetical by name. Once you have done this, `sortByName()` should work properly. (20 pts)

2. Next, you must implement `public void sortByPlanet()` to sort the Moons by Planet that they orbit, in order of increasing distance from the sun (i.e., Earth first and Neptune last; Mercury and Venus do not have moons). You should pass a **lambda** to the `SortWrapper.sort(T[], Comparator<T>)` method that we have provided to do this. (30 pts)  
 - You **must** use the provided wrapper method. Do *not* use `Collections.sort()` or `Arrays.sort()` directly. This allows us to test and grade your quiz properly.  
 - `Enum::compareTo()` or `Enum::ordinal()` could be helpful here (check the Java API Docs for details).

3. Next, create an iterator for MoonList. The iterator class must be named `MoonIterator` and must be an inner class of MoonList. Make sure to implement a cursor, `hasNext()`, and `next()` properly. You do not need to implement `remove()`. (30 pts)  
 - Java 8 should let you compile correctly without implementing `remove()`, but if it complains, feel free to use this implementation to make the compiler shut up about it.  :)  

```
        public void remove() {
            throw new UnsupportedOperationException();
        }
```

4. Make `MoonList` implement the `Iterable<Moon>` interface and implement a stub version of the method that the interface requires. (10 pts)

5. Finally, change the method body of the method you stubbed out in the previous step to return the appropriate thing (i.e., finish the correct implementation of this method). You can only do this after successfully implementing `MoonIterator` in the step above. (10 pts)  

### MoonTest
This is just a test class in which you can test your code. Once you have finished the quiz correctly, you can run the MoonTest successfully. It will print a list of Moons alphabetically and then the same list of Moons sorted by Planet. We have already written some test code, but you can definitely write more if you want!

Remember that this is not the code we will use to grade the quiz, however. Be sure to use `sbt grade` to run the actual tests and get a preview of your quiz grade.

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final grade. If this completes without a compilation failure, proceed to submit with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**

### Tips:
- Stub out the required constructors and methods in your classes with dummy return values and then go ahead and submit. This will get you *some* points and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last run, then `sbt submit`
- Look at the test code in `src/test/java` to see how your class is used.

