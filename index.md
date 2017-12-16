## Welcome to the (unfinished) world of Statecharts

What is a statechart?

A statechart can be explained in many ways, and we'll get to those explanations, but essentially, a statechart is a drawing.  Here's a simple statechart:

/* insert drawing of statechart */

However, this drawing might not be so useful for software engineers who want to reap the benefits outlined elsewhere on this site, so let's dive into some other ways of describing what a statechart is.  The original paper that defines statecharts bills them as "A visual formalism for complex systems" (Harel, 1987).  With that out of the way, let's try to explain statecharts.

### Introduction to statecharts

A statechart is a state machine, so if you need a refresher on what they are, read up before continuing.  A statechart is a state machine where each state in the state machine may define its own smaller state machine.

- When a state is entered, its state machine (substates) "start" and a substate is entered
- When a state is exited, its state machine is exited too, i.e. any substates also exit

This happens in addition to normal state machine behavior, namely entry and exit actions.

Like state machines, statecharts also react to events; events are _dealt with_ by the states and the main side effects are specified by what happens upon entering and exiting states.

Statecharts aren't restricted to just two levels; a statechart is a hierarchical structure, much like a file system or Object Oriented inheritance or prototype hierarchies.

### Usefulness of statecharts

The concepts of statecharts and how they function can be applied to many programming disciplines.  They don't fit all problem spaces, but when the system in question reacts to events, and has a different _behaviour_ depending on previous events, then a statechart might be a good fit.

* how to implement in plain JS page
* how to implemnet in a react page


