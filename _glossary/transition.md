---
title: Transition
oneliner: the instantaneous transfer from one state to another.
---

# Transition

In en executing state machine, a transition is the instantaneous transfer from one [state](state.html){:.glossary} to another.  When defining a state machine, a transition defines what happens when certain conditions arise

## Notation

A transition is depicted as a curved line between states.  The name of the event that triggers the transition is written close by, along with any guards.

![A transition, between two states](transition.svg)

A transition from the state to itself is depicted as a segment of a circle:

![A transition from a state to itself](transition-self.svg)

## SCXML

In Statechart XML, a transition is a `<transition>` element nested inside the `<state>` element to which it applies.  The `target` attribute identifies the state to which it points, while `cond` is used for the guard.

   <state id="my_state">
     <transition event="some_event" target="my_state" cond="some_guard()"
   </state>

