---
title: Automatic transition
oneliner: A transition that happens immediately upon entering a state or immediately after a condition arises
breadcrumbs:
  - id: transition
    name: Transition
aka:
  - title: Eventless transition
    oneliner: Another name for Automatic transition, a transition that is not tied to a particular event
    url: automatic-transition.html
---

# Automatic transition

_Also known as **Eventless transition**_

Automatic transitions are [transitions](transition.html){:.glossary} that are triggered as soon as a state is entered, sometimes causing the state that was just entered to exit.

Automatic transitions don't have an associated [event](event.html){:.glossary}, as the mere being in the state implies that the transition should be taken.

Automatic transitions are usually [guarded](guard.html){:.glossary}. Such a guarded automatic transition is checked immediately after the state is entered. If the condition doesn't hold then the machine remains in the state, with this automatic transition in play _for as long as the state is active_. Every time the statechart handles an event, the guard condition for these automatic transitions are checked. If ever the guard condition ever succeeds, then the transition happens.

If there are many automatic transitions in play, they are all checked. In some statechart systems, only one guard is allowed to be true at any point in time; in others, the transitions are ordered, and the guards are checked until a one of them succeeds.

## Notation

A transition arrow, but without the name of an event, only guards and/or actions.

```
           [ i > 4 ]
    ---------------------->
```

## Usage

Guarded transitions can be used to cause a machine to "wait" in a certain state, _until_ some condition holds, regardless of what else is happening in the form of events. For example, a machine could be in the 'filling' state until some threshold is reached, by defining an automatic transition from the 'filling' state with a guard `contents >= capacity`. Immediately after the contents reach the capacity, it would exit from this 'filling' state.

By using an _in_ guard, it is possible to coordinate different parts of a [parallel state](parallel-state.html){:.glossary}. When the one region ends up on a certain state, it can wait until another region enters a specific state.

If a machine is in a state with a guarded automatic transition, then that guard is checked as often as possible. Being event–driven, the guards are effectively only checked whenever an event has been processed, but also after other automatic transitions have fired, or other internal events (such as [raised events](raised-event.html){:.glossary}) are fired.

Automatic transitions can be used to implement a [condition states](condition-state.html){:.glossary}, in other words, a state that only has automatic transitions. This is done by creating a state that only declares guarded automatic transitions, in such a way that it is guaranteed that the machine will always pick a transition upon entry, never _resting_ in that state.

## SCXML

In SCXML, automatic transitions are `<transition>` elements that don't have an `event` attribute:

```
<transition target="otherstate" cond="mycondition"/>
```

## XState

In XState, an automatic transition is called a [transient transition](https://xstate.js.org/docs/guides/transitions.html#transient-transitions). It is a normal transition that is hooked to the null event identified by the empty string:

```
on: {
  '': [
    { target: 'otherstate', cond: mycondition }
  ]
}
```
