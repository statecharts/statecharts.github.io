---
description: Using the FizzBuzz programming puzzle as a backdrop, this post shows how hierarchy can be leveraged to control behaviour.
---

# FizzBuzz with hierarchical states

FizzBuzz is a programming puzzle, easily solvable using a simple for-loop, and a couple of if-tests.  For the purpose of this article, the puzzle has been described in terms of an event driven system, so that we can explore some statechart concepts.  See [FizzBuzz](fizzbuzz.html) for an explanatory introduction.

In this post, the problem will be solved in a novel way, by using states to keep track of what is supposed to happen.  We will end up with quite a lot of states, but they will all be pretty simple.  The problem will be split into discrete problems: Fizz and Buzz.  We will use a [parallel state](glossary/parallel-state.html){:.glossary} to tie them together.  To begin with, we won't have any coordination between the regions, as we'll just use the states themselves to figure out what to do, _outside_ the statechart.  Also note that this is not an endorsement to use statecharts to solve FizzBuzz!

## Start with digits

To get us started, we'll take the fizzbuzz problem and provide an event driven scaffolding.  This is because state machines and statecharts are inherently event driven.  After we pass an event to the state machine, we'll check which state it's in.  To begin with, we'll just set up to relatively empty regions, that doesn't even have "on" states, just "off" states:

(statechart with two regions, fiz and buzz, with off initial states.  Statecharts shows digis every time.)

To begin with we don't even care which state we're in, so we just print out the digit.

https://codepen.io/mogsie/pen/ROyqmM

## Showing fizz at the right time

We'll start by looking at the requirement of Fizz: Only print out Fizz if a digit is divisible by three, or, put it another way, _every third digit_.  Armed with that knowledge, we can allow **Fizz** to have _three substates_, and set them up so that they toggle between one another whenever the "increment" event happens.  This will cause the Fizz region to be in the "on" state every third event:  "Off1", "Off2", "On", "Off1", "Off2", "On", and so on.

*image of fizz region zoomed in*

In our event handling loop we can now inspect if "Fizz" is "on" then we print out fizz instead of the digit

``` javascript
if (state.value.fizz == 'on') {
  document.write('<li>Fizz</li>');
} else {
  document.write('<li>' + i + '</li>');
}
```

https://codepen.io/mogsie/pen/EJLGZX

Note how the code doesn't care what the names of the "off" states are, they could be called "Sally" and "Duc" — it doesn't matter.  It only cares if "fizz" is in the "on" state.

## Solving for Buzz

Buzz can be solved in the same way.  The Buzz region can have five substates, ensuring that only every fifth "increment" event causes the Buzz state to be "on".

*image of buzz*

Now it's important to explain what happens in a parallel state, with many regions as shown above.  The _parallel_ nature of the parallel states is that each region is essentially active at the same time.  This means that when the "increment" event happens, _both_ regions get to react to the event.  So if "fizz" is in "off1" and "buzz" is in "off2" then **both** fizz.off1 and buzz.off2's transitions to their next state are activated, meaning that the next state is 'fizz.off2' and 'buzz.off3'

Parallel states are often used to model things that function independently of one another, but that can react to the same events.  In our case, we've got the "Fizz" region counting to three, and the "Buzz" region (independently of Fizz) counting to five.

In our code, we now have to deal with Buzz in a similar way as with Fizz, and we might as well solve for "FizzBuzz" too.

``` javascript
if (state.value.fizz == 'on' && state.value.buzz == 'on') {
  document.write('<li>FizzBuzz</li>');
} else if (state.value.fizz == 'on') {
  document.write('<li>Fizz</li>');
} else if (state.value.buzz == 'on') {
  document.write('<li>Buzz</li>');
} else {
  document.write('<li>' + i + '</li>');
}
```

https://codepen.io/mogsie/pen/mgLajg

## The full statechart

Here's the final statechart:

*image of full fizzbuzz result*

The full statechart is quite overwhelming, and at first glance, it might not be easy to understand the importance of the "on" states, as opposed to the "off" states.  We can use a technique called "clustering" to group together states that have common behaviours.

The important behaviour we want to capture is the switching from an "off" to an "on" state and then back again.  Clustering (grouping) the states ... bla bla some words that lead to the next pen where all the 'off' states are grouped.  Show zoomed out variants with hidden "off" states.

https://codepen.io/mogsie/pen/vMjvMM

## Conclusion

This was an introduction to the use of a parallel states to maintain two separate trains of thought in a single statechart.  Finally, states were moved to a substate in order to make it easier to ignore the finer details of the statechart when "zooming out".
