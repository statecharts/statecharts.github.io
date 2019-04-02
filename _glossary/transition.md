---
title: Transition
oneliner: The instantaneous transfer from one state to another.
---

# Transition

In an executing state machine, a transition is the instantaneous transfer from one [state](state.html){:.glossary} to another.  In a state machine, a transition tells us what happens when an [event](event.html){:.glossary} occurs.

When an event happens, the currently active state(s) are inspected, looking for an outbound transition that could be triggered by the event.  If it is [guarded](guard.html){:.glossary}, the guard is checked, and the machine keeps looking for a transition.  At last, if a transition is found, it is then _executed_ by [exiting](exit.html){:.glossary} the state in question, and [entering](enter.html){:.glossary} the state that the transition points to.

A [self transition](self-transition.html){:.glossary} is a transition that goes from and to the same state.

A [local transition](local-transition.html){:.glossary} is a transition that does not exit the source state, but the target state _must_ be a substate of the source state.

An [automatic transition](automatic-transition.html){:.glossary} is a transition that is not tied to any particular event, but rather tries to fire at all times.  Automatic transitions are usually guarded.

A transition can define [actions](action.html){:.glossary} that will be executed whenever at transition is executed.

## Notation

A transition is depicted as a curved arrow.  The name of the event that triggers the transition is written close by, perhaps on top of the arrow.

![A transition, for the event _my_event_](event-arrow.svg)

The transition always sits between two distinct states

![A transition from _somestate_ to _otherstate_ given the _my_event_ event](event.svg)

The state that the arrow points _from_ is the state in which the event in question is handled.  The state that the arrow points _to_  is the state that the state machine ends up in, if the transition is executed.

A transition can have multiple targets, in case of targetting different regions of a [parallel state](parallel-state.html){:.glossary}

## Usage

Alongside _states_, transitions are the main ingredient of state machines and statecharts.  A single transition defines how the machine might react to a particular event in case the machine is in a particular state.  The combination of the different states and their transition together make up the statechart's behaviour.

Transitions are primarily used to move the machine between states, possibly executing _transition actions_ if they are defined.

## SCXML

In Statechart XML, a transition is a `<transition>` element nested inside the `<state>` element to which it applies.  The `target` attribute identifies the state to which it points, while `cond` is used for the guard.

```xml
<state id="somestate">
  <transition event="my_event" target="otherstate" />
</state>
<state id="otherstate" />
```

Multiple transitions for the same event are defined by defining several transitions for the same event.  The transitions are inspected in _document order_:

```xml
<state id="somestate">
  <transition event="my_event" cond="a_guard" target="otherstate" />
  <transition event="my_event" target="thirdstate" />
</state>
<state id="otherstate" />
<state id="thirdstate" />
```

## XState

In XState, a transition is defined using [the *on* property](https://xstate.js.org/docs/guides/transitions.html) of a state.  The key is the event in question, and the value is the name of the target state:

```json
"somestate": {
  "on": {
    "my_event" : "otherstate"
  }
},
"otherstate": {}
```

It is also possible to define an array of transitions for any given event.  Each element in the array defines a transition to be handled by that event, and they are inspected in array order:

```json
"somestate": {
  "on": {
    "my_event" : [
      { "target": "otherstate", "cond": "a_guard" },
      { "target": "thirdstate" }
    ]
  }
},
"otherstate": {},
"thirdstate": {}
```

