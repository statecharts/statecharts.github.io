---
title: If statecharts are so great, why aren't they used more widely?
sitemap:
  lastmod: 2020-05-24
  priority: 0.7
description: Since statecharts are so useful, and supposedly have all of these benefits, then why aren't all developers using these techniques?
keywords:
  - state
  - usage
  - faq
  - why
---

# Why aren't statecharts used more?

Since statecharts are so useful, and supposedly have all of these benefits, then why aren't all developers using these techniques?

## Constructing the User Interface with Statecharts

Ian Horrocks has a section devoted to this, saying that

> \[...] if statecharts are as powerful as I say they are, why are they not widely used? \[...] Statecharts are not widely used for user interfaces because it is not obvious that such interfaces can be designed in this way. \[...] There is a general perception that user interface construction is easy because of the powerful development tools that are available.  The fact is, user interface tools do not solve all the problems and the cost of maintaining user interface code can be huge.
>
> <cite>Ian Horrocks, Constructing the User Interface with Statecharts, page 202</cite>

Horrocks also mentions that most books on the subject have examples based on electrical devices such as traffic lights, digital watches, the gears on a car and so on.  Such examples don't help developers who might want to use statecharts for User Interfaces, or to tackle complexity in general.  The hope is that the statecharts.github.io project will provide guidance beyond what programming books of 1999 had available.

## "Do the simplest thing that could possibly work"

Programmers are taught early on to implement "the simplest thing that could possibly work", and rarely does a statechart fit that bill.  The principle of _the simplest thing_ is (as a lot of these principles are) misunderstood, and when the principle is correctly applied, then yes, a statechart might be defined as _simpler_ than a lot of implicit booleans.

The **easiest** thing that could possibly work will _always_ be a set of implicit booleans, switch statements etc, because by the very definition, it _can possibly_ work, if you just get all of the if-statements correct, it _will_ at some point, work.  However, the step of simplifying is often forgotten, or skipped completely.  It is in this step that one might introduce a statechart to _simplify_ a complicated implicit state.

## YAGNI

Anecdotal evidence suggests that the main reason for statecharts not being used is the YAGNI mindset, short for _You Ain't Gonna Need It_.  Complexity creeps in one boolean at a time, and along with that complexity comes bugs, but like the frog in the frying pan that doesn't notice a slow increase in temperature, developers don't notice the complexity creep.

When developing a component you start out with a simple model of its behaviour, and the different modes it has, so very early on, the component starts to gain a few booleans.  The booleans might be explicit, like `boolean requestIsActive`, or it could be more implicit, such as the null-ness or "truthiness" of a variable: `var request = makeHttpRequest(...)`

The component then starts making decisions on how to react to an event based on those explicit or implicit flags, e.g. `if (! requestIsActive)` or `if (request == null)`.  This functions pretty well on the scale of very small, where you have two or perhaps three different behaviours.  But pretty soon you will find a messy if-statement, or a switch statement, that modifies the state of various variables in order to try to keep them consistent.

It's as if you don't need statecharts until it's too late.

## Other, simpler solutions do exist

There are alternatives to statecharts.  It's possible to reap some of the benefits by using simpler solutions, such as state machines.

Developers are sometimes aware of the problems with the cacophony of booleans.  They might have found a better solution than booleans to solve their behaviour problems.  A common solution is a state "enum", one for each "state", a switch statement that handle all incoming events, and possibly only allow specific transitions between enum values.  Another solution is the [State pattern](https://en.wikipedia.org/wiki/State_pattern) which places the knowledge of how a component behaves into its own object, which is switched out with when the "state" changes.  These are of course a great improvements over "distributed booleans", and can sometimes be enough to deal with the complexities at hand.

Statecharts were invented to solve glaring deficiencies in state machines (both the simple enum and the state pattern essentially implement a state machine).   Sometimes the problems solved by statecharts (like [state explosion](/state-machine-state-explosion.html)) do not apply to a problem.  In those cases, a simpler solutions might be considered to be good enough, and statecharts might not even be considered, ignoring the other benefits that statecharts have over state machines.
