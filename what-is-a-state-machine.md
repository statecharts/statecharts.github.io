---
sitemap:
  lastmod: 2020-04-10
  priority: 0.7
description: A state machine is a way of modeling program state so that a program will always be in exactly one state at any one time.
keywords:
  - state
  - state machine
  - state machines
  - FSM
  - finite state machine
  - finite state machines
---
## What is a state machine?

[Wikipedia defines a _finite-state machine_](https://en.wikipedia.org/wiki/Finite-state_machine) (FSM) as:

> an abstract machine that can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some external inputs; the change from one state to another is called a transition. An FSM is defined by a list of its states, its initial state, and the conditions for each transition.

And further:

> A state is a description of the status of a system that is waiting to execute a transition.

A state machine is _also_ a visual depiction of such an abstract machine.

## Example

Here is a visual depiction of a simple state machine.  It is a model of a simple on/off switch.

**A simple on/off switch with two states.**{:.caption}
![A state machine with two states, "on" and "off", the "flick" event transitioning between them. The On state defines actions to turn a light on and off on entry and exit, respectively](on-off.svg)

Some observations over this machine.

* It consists of two states, "on" and "off". This machine can therefore be in exactly one of the two states at any point in time.  In other words, the transitions between states are instantaneous.
* The "flick" event causes it to transition between states.
* When the machine _enters_ the "on" state, a side effect occurs.  A light is turned on.
* When the machine _exits_ the "on" state, another side effect occurs.  A light is turned off.

This simple state machine is comparable to a boolean variable—which can either be true or false—that controls the _on_-ness of something.

## What is state anyway?

Program state is the _set of all variables in a program and their values at any point in time_ (see [Wikipedia](https://en.wikipedia.org/wiki/State_(computer_science)#Program_state)).  A program or software component that has five independent variables, that each could be true or false, then it could in theory _be_ in any of 32 states (2 to the power of 5 = 32).  However, a program will often have _invalid_ states, and in traditional software, the variables are carefully checked and manipulated in such a way that these invalid states don't happen.

A state machine is an alternative way of modeling program state:  Instead of defining independent variables, a machine is crafted specifically to handle what states are possible, and when a machine is a given state, what _next_ state is allowed.  Those five independent boolean variables are replaced with a single _state machine_ which intrinsically can only be in valid states.

## Relationship with statecharts

Understanding state machines is almost the same as understanding **statecharts**.  In many ways, statecharts are the "bigger brother" of state machines, designed to overcome some of the limitations of state machines.

State machines are closely related to their bigger brother, _statecharts_.  A statechart is essentially a state machine that allows any state to include _more_ machines, in a hierarchical fashion.  This is to overcome some of the limitations that are inherent to state machines.

The primary goal of statecharts.github.io is to help you to understand statecharts.  An understanding of state machines is a nice side effect.  [What is a statechart?](what-is-a-statechart.html)

## Abstract machine vs run-time

An important distinction must be made between the _abstract machine itself_ (e.g. the drawing of a state machine, or the code) and the more concrete _run-time_ execution of a particular abtract machine.  This distinction is similar to the difference between a _class_ (abstract definition) and an _object_ (concrete instantiation).  Similarly, for a single abstract machine, there may be many _executions_, just as there are often many instances of any particular class.

The terms "statechart", "state machine" and "FSM" are often used to mean both the abstract and run-time form, although the run-time form sometimes has the qualifier "run" or "execution", as in "state machine execution" or "statetchart run".

An **abstract state machine** is a software component that defines a finite set of states:

- One state is defined as the *initial* state.  When a machine starts to execute, it automatically enters this state.
- Each state can define *actions* that occur when a machine enters or exits that state.  Actions will typically have side effects.
- Each state can define *events* that trigger a *transition*.
- A transition defines how a machine would react to the event, by exiting one state and entering another state.
- A transition can define *actions* that occur when the transition happens.  Actions will typically have side effects.

When "running" a state machine, this abstract state machine is **executed**.  The first thing that happens is that the state machine enters the "initial state".  Then, events are passed to the machine as soon as they happen.  When an event happens:

- The event is checked against the _current state_'s transitions.
- If a transition matches the event, that transition "happens".
- By virtue of a transition "happening", states are _exited_, and _entered_ and the relevant actions are performed
- The machine immediately _is in_ the new state, ready to process the next event.

## Further reading

* [What is a statechart?](what-is-a-statechart.html) — Build on the knowledge of state machines to
* [An example state machine](on-off-state-machine.html) — Explain some statechart concepts by building on the simple "on off" state machine.
