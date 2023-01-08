# Exercise E2

Template repository for exercise E2.
Course [IDATA2503 Mobile applications](https://www.ntnu.edu/studies/courses/IDATA2503) at [NTNU](https://ntnu.edu),
campus [Aalesund](https://www.ntnu.edu/alesund).

## Intention

The intention with this exercise is to practice a bit of writing Dart code and to get familiar with some Dart-specific
concepts (which you don't find in Java). Also, you can practice documentation-search a bit (handling of timestamps, in
part 3).

While this exercise may seem too simple, "let's walk before we run"! 😉

## Hand-in process

To get auto-grading working properly, you need to create a clone of the template repository within GitHub Classroom. Use
the invitation link you got from Blackboard!

This exercise will be graded automatically, by a robot. Every time you make a new commit to the `master` branch, an
auto-grading script will be run. This script will run all the unit-tests inside the `test` directory.

**To pass the assignment, you need to write code so that all unit tests pass.**

The auto-grading script takes a while - it builds the whole environment with containers, etc. To check whether your
solution is right, you can run the unit tests locally on your machine.

To run the tests locally, execute the following command in a terminal, inside the project directory:

- Tests for the first part: `dart test test/step_1.dart`
- Tests for the second part: `dart test test/step_2.dart`
- Tests for the third part: `dart test test/step_3.dart`

If you want to test whether the whole solution is ready, you can run tests for all the three parts at once:
`dart test test/step_1.dart test/step_2.dart test/step_3.dart`

## Instructions

The exercise consists of three parts.

### Part 1 - basic class practice

In this part you will practice the basic syntax for creating classes in Dart.

Create a class called `Animal`, in a file named `lib/animal.dart`. The `Animal` class must have the following features:

1. A String property (field) called `name`
2. An `int` property called `legCount`
3. A `boolean` property called `hasWings`
4. A named constructor where the `name` and `legCount` properties are required while `hasWings` property is optional and
   is set to `false` by default. I.e., user of the class should be able to instantiate an `Animal` object using the
   following syntax: `var a = Animal(name: "Crocodile", legCount: 4);`
5. Note: the Udemy videos consider nullable properties, which in the newest versions of Dart would be created using
   the ? signature. We want non-nullable properties. That means, you need to add `required` keyword for the properties
   in the constructor. See
   an [example here](https://www.technicalfeeder.com/2021/11/dart-flutter-constructors-tutorial-with-examples/#toc5).
6. A getter function called `canFly` which returns `true` if `hasWings` is `true`

When you are done with these steps, you should be able to run `dart test test/step_1.dart` in the terminal and see all
the tests passing. Also, if you make a commit to the `master` branch, you should see one test passing in the
auto-grader.

### Part 2 - inheritance and calling parent-constructor

In this part you will tinker a bit with inheritance and syntax for calling parent-constructors.

Create a file `lib/flying_animal.dart`, inside it create a subclass of `Animal`, called `FlyingAnimal` with the
following features:

1. A floating-point property called `flyingSpeed`
2. A constructor with two positional parameters: `name` and `flyingSpeed`. The `flyingSpeed` should be set to `3.14` by
   default. This constructor must initialize the base class properties: `legCount=2` and `canFly=true` (in addition to
   setting the value for `name` property). I.e, user must be able to instantiate a flying animal using the following
   syntax: `var fa = FlyingAnimal("Duck");` Also, if the user wants to sett the flying speed manually, this must work
   also: `var gonzales = FlyingAnimal("Speedy Duck", 220);`
3. Inside the class create a method `fly()` which prints the following to the
   console `"<animalName> is flying at <speed>m/s"`,
   where `<animalName>` and `<speed>` are replaced by values of `name` and `flyingSpeed` respectively. For example, for
   the Speedy duck mentioned above, this would translate to `"Speedy Duck is flying at 220.0m/s"`. Note: no space
   between `220` and `m/s`!

You can take a look at the tests in `test/tep_2.dart` file to see the expected interface. Also, you should be able to
run the tests in the terminal: `dart test test/step_2.dart`

### Part 3 - Timestamp formatting

In this part you will simply stretch your fingers (and brain) a bit after the summer break ;). You will write very basic
conditional statements and practice finding documentation on the net.

The last step is to implement function `formatTime(Datetime timestamp)`, inside the file `lib/tools.dart`. The function
must format the given `timestamp` according to the following specification:

1. You need to find out the current time first. The formatting will be based on the `timestamp` value relative to
   current time.
2. If the given `timestamp` is less than one second away from the current timestamp, then the function must
   return `"now"`.
3. If the timestamp is one second or more in the future, return it formatted as a date and time in the following
   format: `"YYYY-MM-DD hh:mm:ss"`, where `YYYY` is a four-digit year, `MM` is a two-digit month starting at 01 (01, 02,
   …,
   12), `DD` is two-digit day (01, 02, …, 31), `hh` is two-digit hours (00 to 23), `mm` is two-digit minutes (00 to 59)
   and `ss`
   is two-digit seconds (00 to 59). For example, the deadline of this exercise is: `"2022-09-16 18:00:00"`.
4. If the `timestamp` is 1 second in the past, return `"1 second ago"`.
5. If the `timestamp` is 2 to 59 seconds in the past, return `"x seconds ago"`, where x is the difference between
   current timestamp and the given `timestamp`. For example: if the current time is `2022-08-38 18:25:40` and the
   given `timestamp` is `22-08-30 18:25:15`, then the function must return `"25 seconds ago"`.
6. If the `timestamp` is 1 to 59 minutes ago, then the function returns `"x minute(s) ago"`, where x is the difference
   in minutes, rounded. For example, if the timestamp is 2 minutes and 25 seconds ago, the function
   returns `"2 minute(s) ago"`. If the timestamp is 2 minutes and 30 seconds ago, the function
   returns `"3 minute(s) ago"`, which is 2.5 minutes rounded up. Etc. up to a difference of 60 minutes and 29 seconds.
7. If the difference is less than 24.0 hours, the function returns `"x hour(s) ago"`, where x is rounded, as always
   (3.49 hours is rounded to 3 hours, while 3.5 hours is rounded to 4 hours).
9. If the difference is from 24.0 hours but less than 36 hours, the function must return `"one day ago"`.
10. If the difference is more or equal to 36 hours but less than 7 days, the function must return `"x days ago"`, where
    the same rounding rules apply (1.1 days up to 1.4999 days are rounded to 1 days, while 4.5 days up to 5.4999 days
    are rounded to 5 days).
11. If the `timestamp` is 7 days or more in the past, return the full timestamp, the same format as for timestamps in
    the future: `YYYY-MM-DD hh:mm:ss`.
12. If the given `timestamp` is `null`, return `null`.

To check whether your code is correct, run `dart test test/step_3.dart`

Remember to make a commit to the `master` branch and push it to GitHub!
