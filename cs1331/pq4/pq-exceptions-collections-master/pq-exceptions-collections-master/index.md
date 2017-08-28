[Download Zip](https://github.gatech.edu/cs1331-fall2015/pq-exceptions-collections/archive/10am.zip)

## Intro

## Problem Description
### Exceptions - 50pts
1. Write a checked (5pts) exception (10pts) named `NoSuchUserException` with the message: `User <id> does not exist`, where `<id>` is a `int` parameter passed into the constructor of the exception as the first parameter (10pts). The constructor should also accept a second `Throwable` parameter which represents the cause of this exception. (5pts)
2. Modify the code in `UserDao` (Dao = Database Access Object) in the `public String getUser(int id)`. Currently, this code attempts to retrieve the user by indexing into a backing array with the provided id. This obviously will throw an `ArrayIndexOutOfBoundsException` if the array is smaller than the number passed in, and this exception is not very user-friendly. Alter the existing code to:
    1. Catch the `ArrayIndexOutOfBoundsException` (5pts)
    2. Throw a `NoSuchUserException` with the user id and the `ArrayIndexOutOfBoundsException` as the arguments to the constructor. **HINT:** Don't forget to modify the method header accordingly... (15pts)

### Collections - 50pts
Provided is a `Zoo` class and an `Animal` enum. Currently, `Zoo` uses an array to store `Animal`s, but this is not very flexible. You will be modifying `Zoo` to take advantage of Java's Collections API. 

1. (10pts) Change the array to a `List`. Modify the `public void add(Animal a)` and `public List<Animal> getList()` methods to reflect the change. **Hint:** These methods can be completed in 1 line.
2. (20pts) Write a method named `getTypes()` that returns an appropriate Java collection containing the types of animals present in the zoo. Each type should only be present once. **HINT:** This can be done in a single line once you complete part 1. For example, given the following code:
        
        Zoo atlZoo = new Zoo();
        atlZoo.add(Animal.LION);
        atlZoo.add(Animal.TIGER);
        atlZoo.add(Animal.LION);
        atlZoo.add(Animal.LION);
        atlZoo.add(Animal.BEAR);
..., then `atlZoo.getTypes()` would return some Java collection containing `LION`, `TIGER`, and `BEAR` each exactly once.

3. (20pts) Sometimes, zoo officials need to count how many of each animal are in a particular section of the zoo. Write a method named `getAnimalCounts(Animal[] animals)` that counts the number of occurences of each possible animal (**HINT:** use your `getTypes()` method here!) and returns a `Map<Animal, Integer>` mapping every possible `Animal` to the number of times it was present in that section of the zoo. Note: every animal must have a count, even those that were not present. For example, given the code from part 3, `atlZoo.getCounts(new Animal[] {Animal.LION, Animal.LION, Animal.LION, Animal.LION, Animal.BEAR})` would return the mapping:

Type  | Count
---   | ---
LION  | 4
BEAR  | 1
TIGER | 0

## Tips

## Submission
- Run `sbt grade` to get a report of style errors, test failures, and a final grade. If this completes without a compilation failure, proceed to submit with:
- `sbt submit`
- **Non-compiling solutions will receive a 0!**


### Tips:
- Stub out the required constructors and methods in your classes with dummy return values and then go ahead and submit. This will get you *some* points and is better than waiting to submit until the end.
- Run `sbt grade` after every change. If your grade has improved since the last run, then `sbt submit`
- Look at the test code in `src/test/java` to see how your class is used.

