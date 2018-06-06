# FizzBuzz with Actions and guards

FizzBuzz is a programming puzzle, easily solvable using a simple for-loop.  The puzzle has been described in terms of an event driven system, in order to allow us to explore some statechart concepts.  See [FizzBuzz](fizzbuzz.html) for an introduction to what we’re trying to achieve here.

Here, we will show how [actions](glossary/actions.html){:.glossary} are used to let the statechart tell us what to do.  We will use [guards](glossary/guard.html){:.glossary} to tell us which state we should go to

Let’s start with a machine that prints out only the digits.

TK Diagram:

Here is the xstate representation, in JSON format:

``` javascript
{
  "initial": "digit",
  "states": {
    "digit": {
      "onEntry" : “print_digit”,
      "on": {
        "increment": "digit"
      }
    }
  }
}
```

We can put this through our sample code to see that it indeed only prints out the digits:

``` javascript
const actions = {
  print_digit: (i) => console.log(i);
}

state = machine.initialState;
for (i = 1; i < 100; i++) {
  state = machine.transition(state, ‘increment’, i)
  state.actions.forEach(item => actions[item](i));
}
```

TK embed this: [On codepen](https://codepen.io/mogsie/embed/aKmZow)

We have a simple machine that has a single state.  It re-enters the `digit` state, causing the onEntry action to happen every time.

Now let’s change the behaviour so that it prints out Fizz when the counter is divisible by 3.  We can introduce a new state, `fizz` and use the event to alternate between the two states, and use the onEntry actions on each state to cause the desired side effect.

TK embed this: [codepen](https://codepen.io/mogsie/embed/XYjKmR)

This machine has two states, and every time it gets the ‘increment’ event it evaluates the condition and transitions to fizz or Digit appropriately.  But we’re repeating the guard condition, which is generally a bad idea.  We can place the event handler on the top level, since they are common for all substates.

TK embed this: [codepen](https://codepen.io/mogsie/embed/MXjeKj)

The machine will exit whatever state it’s in and enter the correct state based on the guard condition of `ìncrement`.

We can now extend this machine to handling the ‘buzz’ case quite easily

TK embed: [On codepen](https://codepen.io/mogsie/embed/jKMrPP)

That was easy.  We could continue doing this for the FizzBuzz case, with the same tradeoffs as in the first non-statechart example shown in the [introduction](fizzbuzz.html).  The `i % 3` and `i % 5` are evaluated many times.  The point is not the execution time of i%5==0.  The point is the maintainability of this long chain of if/else statements.

## Refining the _FizzBuzz_ state

There is one slight optimization we can do.  This will show how substates are "more important" when it comes to reacting to events.  Based on the fact that we’re incrementing, we know a thing or two about `i - 1` — i.e. the previous integer.  IF the previous integer was a FizzBuzz, it is impossible that this integer is a Fizz _or_ a buzz.  It must _always_ be a a digit.  Knowing this we can tell the statechart to ignore the guarded transition, and simply _always_ go to 'digit' when we get an _increment_ event in the 'fizzbuzz' state.

```
    fizzbuzz: {
      onEntry : 'print_fizzbuzz',
      on: {
        increment: 'digit'
      }
    }
```

TK embed this [codepen](https://codepen.io/mogsie/pen/QxKEKj)...

This optimization is a nice one that most imperative solutions miss, because every for-loop usually forgets any calculations in the previous iteration.  With statecharts, insights like this come more naturally.  However, with the this design, it is hard to add more optimizations.  Take a look at [the introduction](fizzbuzz.html) to see other possible solutions.


## Conclusion

We have shown the use of guards and how a single event can cause many possible transitions to be checked.  That the first guard that passes will be taken.  We have shown how actions can be placed on states, and how entering those states triggers those actions.  Finally, we have shown how we can specialize a state, overriding its behaviour simply by adding a transition in a substate.

