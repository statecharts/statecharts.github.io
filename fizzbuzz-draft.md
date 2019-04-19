---
description: Using the FizzBuzz programming puzzle as a backdrop, this post shows how hierarchy can be leveraged to control behaviour.
---

# FizzBuzz with hierarchical states

FizzBuzz is a programming puzzle, easily solvable using a simple for-loop, and a couple of if-tests.  For the purpose of this article, the puzzle has been described in terms of an event driven system, so that we can explore some statechart concepts.  See [FizzBuzz](fizzbuzz.html) for an explanatory introduction.

In this post, the problem will be solved in a novel way, by using states to keep track of what is supposed to happen.  We will end up with quite a lot of states, but they will all be pretty simple.  The problem will be split into discrete problems: Fizz and Buzz.  We will use a [parallel state](glossary/parallel-state.html){:.glossary} to tie them together.  To begin with, we won't have any coordination between the regions, as we'll just use the states themselves to figure out what to do, _outside_ the statechart.  Also note that this is not an endorsement to use statecharts to solve FizzBuzz!

## Start with digits

To get us started, we'll take the fizzbuzz problem and provide an event driven scaffolding.  This is because state machines and statecharts are inherently event driven.  

(statechart with two regions, fiz and buzz, with off initial states.  Statecharts shows digis every time.)

Here, we've chosen to keep some of the logic outside the statehcart, which simplifies the statechart.

## Showing fizz at the right time

Extending
