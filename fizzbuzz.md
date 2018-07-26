# Fizzbuzz in Statecharts

[Fizzbuzz](http://wiki.c2.com/?FizzBuzz) in programming is a program that writes out the numbers 1 through 100 swapping out multiples of 3 and 5 with the words Fizz and Buzz respectively, like so:

> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11…

For numbers that are multiples of both 3 and 5, you write out FizzBuzz.  Imperative solutions are easy to come by, but here I'd like to explore using statecharts to solve this problem, showing different mechanisms and tradeoffs.

Here's some code that only caters for the first two rules, and doesn't handle the case wher the number is divisible by both 3 and 5:

```
// Before adding divisible by 3 AND divisible by 5 => fizzbuzz
For i = 1; i < 100; i++ {
  If i%3 == 0, print fizz
  Else If i%5 == 0, print buzz
  Else print digit
}
```

There are different ways of adding the "new" constraint of being divisible by both 3 and 5:

Example 1: Simply check it first

```
// After (example 1)
For i = 1; i < 100; i++ {
  If i%3 && i%5 == 0, print fizzbuzz
  Else If i%3 == 0, print fizz
  Else If i%5 == 0, print buzz
  Else print digit
}
```

Example 2: Build up a string using concatination, and print out the result:

```
// After (example 2)
For i = 1; i < 100; i++ {
  result = ''
  If i%3 == 0, result += 'fizz'
  If i%5 == 0, result += 'buzz'
  If result is not empty, print result
  Else print digit
}
```

Example 3: Split the i%3 branch in two, by placing an extra test inside that if-test to check if i%5 also matches.

```
// After (example 3)
For i = 1; i < 100; i++ {
  If i%3 == 0
    If i%5==0, print fizzbuzz
    Else print fizz
  Else If i%5 == 0, print buzz
  Else print digit
}
```


The tradeoffs we'll be exploring are:

* (example 1): The `i%3` and `i%5` appear twice each in the code.  It would be nice to have a solution that didn't need to re-check this code.  Using i%15 is just an obfuscation.
* (example 2): Some solutions build up a string of "fizz" if divisible by 3 and append "buzz" if divisible by 5, then print the string if it's nonzero and the digit otherwise.  This obfuscates the fact that the string serves two purposes; boolean _and_ a string value.  It doesn't scale if you have to extend the code to support different rules, since you need to re-evaluate how these strings are being used.
* (example 3): The i%5 test could be put inside the i%3.  In other words if `(i%3==0)` then, if `(i%5==0)` then print fizzbuzz, else fizz.  But then the i%5 test needs to be repeated outside the whole if test. At least the i%3 test is only done once.

In each of these, consider
* How maintainable was the original code?
* How maintainable is the resulting code?

Look at how the code evolved when adding the constraint "for numbers divisible by both 3 and 5, print _fizzbuzz_".  This tells us about the maintainability of the original code. The maintainability of the resulting code can be explored by doing thought experiments such as "How would I add more constraints to the code, or change the existing constraints?".  For example, divisible by seven should print out Woof and divisible by three, five and seven should print out Woofizzbuzz"

## Event driven

However, in order to do anything with statecharts, we have to relate to the fact that statecharts are by nature event-driven: They react only to events.  So the first thing we need to do is make the FizzBuzz problem event driven, by defining an event that the state machine needs to react to:

```
actions.print_digit = (i) => console.log(i);
actions.print_fizz = () => console.log('fizz');
actions.print_buzz = () => console.log('buzz');
actions.print_fizzbuzz = () => console.log('fizzbuzz');

// After event-driving it
For i = 1; i < 100; i++ {
  state = machine.transition(state, 'increment', i)
  For each state.actions
    Perform the action
}
```

Actions are things that happen instantaneously.   The statechart will tell us what to do, and we will blindly do what it tells us to do.

We can also model the printing of some text to be a long running process, perhaps setting the text of a <div> (and subsequently removing the text when the activity is supposed to stop) the text.

```
// alternative, using activities
For i = 1; i < 100; i++ {
  state = machine.transition(state, 'increment', i)
  // state.activities tells us what activities should be happening right now
}
```

Every time something happens in our loop (i++) we send the 'increment' event to the state machine, and do whatever the state machine tells us to do.  Now that the problem has been framed in an event driven manner, we can start to discuss how to design a statechart that has these properties.

* [FizzBuzz with Actions and Guards](fizzbuzz-actions-guards.html) — replicates the naïve if-test from example 1, with essentially the same problems.
* [FizzBuzz with Actions and Internal Events](fizzbuzz-actions-internal-events.html) — divides the problem into digit, fizz, buzz and fizzbuzz, solving each as a region of a parallel state, and using internal events (automatic 'in' guarded transitions) to coordinate between regions.
* [FizzBuzz with Activities and something](#) (coming soon)
