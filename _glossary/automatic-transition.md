---
title: Automatic transition
oneliner: A transition that happens immediately upon entering a state
---

# Automatic Transition

Automatic transitions are [transitions](transition.html){:.glossary} that are triggered as soon as a state is entered, sometimes causing the state that was just entered to exit.

Automatic transitions don't have an associated [event](event.html){:.glossary}, as the mere being in the state implies that the transition should be taken.

Automatic transitions are usually guarded.  Such a guarded automatic transition is checked immediately after the state is entered.  If the condition doesn't hold then the machine remains in the state, _with this automatic transition_ in play.  If the guard condition ever succeeds, then the transition happens.  This is usually done by the statechart checking the guard whenever it has handled an event, and whenever a state transition happens.

## Usage

A machine can be asked to "wait" in a certain state _until_ this other part of the statechart reaches a certain state, by using an _in_ guard.  When the condition arises (i.e. the other state is entered) then the guarded automatic transition will happen too.

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
