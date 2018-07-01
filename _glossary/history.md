---
title: History
oneliner: A pseudo-state that remembers the most recent substates the machine was in
---

# History state

A history state is a special type of state in a statechart.  when a transition that leads to a history state happens, the history state itself doesn't become active, rather the "most recently visited state" becomes active.  It is a way for a [compound state](compound-state.html){:.glossary} to remember (when it exits) which state was active, so that if the compound state ever becomes active again, it can go back to the same active substate, instead of blindly following the initial transition.

There are two types of history states, _deep_ history states and _shallow_ history states.  A _deep_ history remembers the deepest active state(s) while a _shallow_ history only remembers the immediate child's state.

## Notation

A history state is denoted by way of a capital letter H enclosed by a circle.

A history state is _deep_ if it is followed by an asterisk *.

## SCXML

SCXML supports both deep and shallow history states by way of [the `<history>` element](https://www.w3.org/TR/scxml/#history):

``` xml
<state id="A" initial="B">
  <history id="A_AGAIN">
    <transition target="C"/>
  </history>
  <state id="B"/>
  <state id="C"/>
  <state id="D"/>
</state>

<!-- elsewhere -->
<transition target="A_AGAIN"/>
```

Here we have a compound state A with substates B, C and D.

* Whenever state A exits, it remembers which of the states, B, C or D was last visited.
* If a transition targets "A_AGAIN", then the last visited state is entered instead.
* If a transition targets "A_AGAIN" before state A has had the chance to remember anything, then A_AGAIN's transition to C is taken.

## xstate

In xstate, a history state is declared using the `history` attribute.  It can be set to `true` or `"shallow"` for shallow history, and `"deep"` for deep history.  A history state may declare a `target` for the initial history.

``` js
"A": {
  initial: "B"
  states: {
    A_AGAIN: {
      history: true,
      target: 'C'
    },
    B: {},
    C: {},
    D: {}
  }
}

// elsewhere
on: {
  something: 'A_AGAIN'
}
```

Here we have a compound state A with substates B, C and D.

* Whenever state A exits, it remembers which of the states, B, C or D was last visited.
* If a transition targets "A_AGAIN", then the last visited state is entered instead.
* If a transition targets "A_AGAIN" before state A has had the chance to remember anything, then A_AGAIN's transition to C is taken.
