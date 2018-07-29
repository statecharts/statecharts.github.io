---
title: Compound state
oneliner: A state that has one or more substates
breadcrumbs:
  - id: state
    name: State
aka:
  - title: Composite state
    url: compound-state.html
    oneliner: In UML, the term composite state is used for Compound State.
  - title: Or state
    url: parallel-state.md
    oneliner: A state where only one substate is active at a time, i.e. a OR b OR c, known as a compound state
---

# Compound State

_Also known as **Composite state** and **Or state**_

A compound state is a [state](state.html){:.glossary} that includes one or more substates.  It is the main differentiating factor between traditional state machines and statecharts.

If there are more than one substates, one of them is usually designated as the [initial](initial-state.html){:.glossary} state of that compound state.

When a compound state is active, its substates behave as though they were an active state machine:  Exactly one child state must also be active.

* When a compound state is [entered](enter.html){:.glossary}, it must also enter one of its substates, usually its initial state.
* When an [event](event.html){:.glossary} happens, the _substates_ of the compound state get to act on the state before the compound state itself gets to act on it.  If a substate handles an event, the event is not passed to the parent compound state.
* When a substate [transitions](transition.html){:.glossary}  to another substate, both "inside" the compound state, the compound state does _not_ exit or enter; it remains active.
* When a compound state [exits](exit.html){:.glossary}, its substate is simultaneously exited too.

Compound states may be nested, or include [parallel](parallel-state.html){:.glossary} states.

The opposite of a compound state is an [atomic state](atomic-state.html){:.glossary}, which is a state with no substates.

A compound state is allowed to define transitions to its child states. Normally, when a transition leads from a state, it causes that state to be exited.  For transitions from a compound state to one of its descendantes, it is possible to define a transition that avoids exiting and entering the compound state itself, such transitions are called [local transitions](local-transition.html){:.glossary}. 


## Usage

Substates are generally introduced to cause a state machine to behave slightly different, but under certain circumstances.  The compound state would define the general behaviour, and substates would define deviations from this behaviour, and what events cause this deviation to be active.

When designing a statechart, the act of changing an atomic state into a compound state (by introducing a substate or two) is called _refining_ the state.  The refinement alludes to the different behaviour encoded in the substates as being a _refinement_, or _specialization_ of the generic behavour of the compound state.

Technically a statechart itself is usually (at the top level) a compound state itself.

### Any State

Some statechart systems have a concept of "Any State" — one that is always active.  Unity's Animation State Machines (where it's called "Any State") and SwiftState (where `nil` denotes the _any state_) are a couple of examples.  The transitions defined for the "Any State" will _always_ be in play.  A compound state can play the same role as the Any State, by defining a single top level state to hold those types of transitions.

Note that while Any State often are defined for the entire state machine, a compound state can be used in a scoped fashion.  A compound state can be used to provide "Any State" like functionality for a smaller part of the statechart if needed.

## Notation

A compound state is a normal state with its substates depicted _inside_ the borders of the state itself:

![A state "Off" with substates A and B](compound-state.svg)

Here, the state called **Off** is a compound state.  It has two states **A** and **B** as its substates.  Note how the substates constitute their own state machine, even with an [initial state](initial-state.html){:.glossary}.

In UML, compound states are called _composite states_.

## Zooming in and out

The nesting of states in a hierarchy can lead to complicated charts when it is visualized.  It is possible to conceal the internals of a compound state by excluding substates from the visualization.  This technique is called _zooming out_.  Zooming _in_ would then reveal the details.

## SCXML

In Statechart XML, a compound state is any state with nested state elements as direct children; this includes `<parallel>`, `<initial>` elements too, as these are also state elements. 

``` xml
<state id="off">
  <transition event="flick" target="on" />
  <state id="A"/>
  <state id="B"/>
</state>
```

## xstate

An xstate compound state is declared using the `states` property of the state, holding an object containing substates.  Each key value pair declares the name and definition of the state, respectively:

``` javascript
"off": {
  "on": {
    "flick": "on"
  }
  "initial": "A",
  "states": {
    "A": {  },
    "B": {  }
  }
}
```

The definitions of A and B have been omitted.

## SCION-CORE

In SCION-CORE, a compound state is declared by specifying the `states` property of the state in question, containing an array of state objects.  Unless explicitly specified using the `initial` property, the first item in the state becomes the initial state.

``` javascript
{
  id: "off",
  states: [
    {
      id: "A",
    },
    {
      id: "B",
    }
  ]
}
```
