---
title: Automatic transition
oneliner: a transition that happens immediately upon entering a state or immediately after a condition arises
breadcrumbs:
  - id: transition
    name: Transition
---

# Automatic Transition

Automatic transitions are [transitions](transition.html){:.glossary} that are triggered as soon as a state is entered, sometimes causing the state that was just entered to exit.

Automatic transitions don't have an associated [event](event.html){:.glossary}, as the mere being in the state implies that the transition should be taken.

Automatic transitions are usually guarded.  Such a guarded automatic transition is checked immediately after the state is entered.  If the condition doesn't hold then the machine remains in the state, _with this automatic transition_ in play.  If the guard condition ever succeeds, then the transition happens.  This is usually done by the statechart checking the guard whenever it has handled an event, and whenever a state transition happens.

If, like normal transitions, there are many automatic transitions, they are all checked.  In some statechart systems, only one guard is allowed to be true at any point in time; in others, the transitions are ordered, and the guards are checked until a passing guard is found.

## Notation

A transition arrow, but without the name of an event, only guards and/or actions.

```
           [ i > 4 ]
    ---------------------->
```


## Usage

A machine can be asked to "wait" in a certain state _until_ this other part of the statechart reaches a certain state, by using an _in_ guard.  When the condition arises (i.e. the other state is entered) then the guarded automatic transition will happen too, as a direct result of the entry to the other state.

A machine can be designed to wait in a certain state until a certain external condition arises, for example a value to exceed a threshold.  If a machine is in a state with a guarded automatic transition, then that guard is checked whenever an event has been processed, and even after other automatic transitions have fired, or other internal events (such as [raised events](raised-event.html){:.glossary} are fired.

Automatic transitions can be used to implement a [condition states](condition-state.html){:.glossary}, in other words, a state that only has automatic transitions.  This is done by creating a state that only declares guarded automatic transitions, in such a way that it is guaranteed that the machine will always pick a transition upon entry.

## SCXML

In SCXML, automatic transitions are `<transition>` elements that don't have an `event` attribute:

```
<transition target="otherstate" cond="mycondition"/>
```

## xstate

In xstate, an automatic transition is a normal transition that handles the empty string:

```
on: {
  '': [
    { target: 'otherstate', cond: mycondition }
  ]
}
```
