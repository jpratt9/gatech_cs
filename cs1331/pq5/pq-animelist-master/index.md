---
title: Programming Quiz Title
---

[Download Zip](https://github.gatech.edu/cs1331-fall2015/pq-animelist/archive/master.zip)

## Intro
You will implement Anime and MyAnimeList. So much fun :-D

## Problem Description
### `Anime` (20pts)
You are provided with an `Anime` class. `Anime` has a name and the year of Production. But you also want to have some ordering so that you can compare two `Anime` objects.

Implement an appropriate interface to impose a natual ordering on `Anime` based on the alphabetic order of name.


### `MyAnimeList`
You have a collection of `Anime` called `MyAnimeList`. You already know how to construct a `MyAnimeList`, and how to add new Anime to it. Now you want to have some ways to sort it and iterate through it.

1. Write the method `public void sortByName()`. The method should sort the animeList by Animes' names. (20pts)

2. Write the method  `public void sortByYear()`. The method should sort the animeList by Animes' yearOfProduction. (20pts). You must use a lambda expression for this method. (10pts)

3. Finish the nested class `AnimeIterator`. (25pts) Make sure to change cursor, `hasNext()`, `next()` and `remove()` properly.

4. Change the method body of `iterator()` from `return null;` to `return new AnimeIterator();`. You can only do this after successfully completing `AnimeIterator` in the step above. (5pts)

### AnimeListTest
This is just a test class in which you can test your code. We have already written some test code, but you can definitely write more if you want!

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final grade. If this completes without a compilation failure, proceed to submit with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**

### Tips:
- Stub out the required constructors and methods in your classes with dummy return values and then go ahead and submit. This will get you *some* points and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last run, then `sbt submit`
- Look at the test code in `src/test/java` to see how your class is used.

