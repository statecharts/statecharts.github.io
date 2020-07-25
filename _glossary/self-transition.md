---
title: Self transition
oneliner: A transition from a state back to itself
breadcrumbs:
  - id: transition
    name: Transition
keywords:
  - self
---

# Self transition

A self transition is a [transition](transition.html){:.glossary} that starts and ends in the same state. When a self transition is taken, the state in question is [exited](exit.html){:.glossary} and [entered](enter.html){:.glossary} again.

## Notation

A self transition is depicted as a segment of a circle, here with the event _again_ attached to it.

![A transition from a state to itself](transition-self.svg)

## Usage

Self transitions are commonly used to "restart" the current state, causing the exit actions to happen, followed by the entry actions. This also resets the timer for how long the machine has been in the state, meaning that [delayed transitions](delayed-transition.html){:.glossary} start counting from 0 again.

It is important to note that self transitions (or transitions to own child states) will in fact _exit_ the state in which the transition starts. This is important to keep in mind and can be a source of confusion, since it leads to the _exit_ and _entry_ actions of the state to be re-executed.

For [compound states](compound-state.html){:.glossary} this means that all substates are exited, and its [initial state](initial-state.html){:.glossary} is entered. This effectively restarts the compound state itself.

## SCXML

In Statechart XML, a self transition uses the standard `<transition>` syntax, with the target the same as its containing state.

```xml
<state id="important_state">
  <transition event="again" target="important_state" />
</state>
```

## XState

In XState, a [self transition](https://xstate.js.org/docs/guides/transitions.html#self-transitions) is defined as any other transition, listing the name of the state as usual:

```json
"important_state": {
  "on": {
    "again" : "important_state"
  }
}
```
