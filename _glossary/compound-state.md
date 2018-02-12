---
title: Compound state
oneliner: A state that has one or more substates
---

# Compound State

A compound state is a [state](state.html){:.glossary} that encompasses one or more substates.

The opposite of a compound state is an [atomic state](atomic-state.html){:.glossary}, which has no substates.

A compound state is allowed to define [transitions](transition.html]{:.glossary} to its child states that avoid exiting and entering the compound state itself, such transitions are called [local transitions](local-transition.html]{:.glossary}.

## Notation

A compound state is a normal state with its substates depicted _inside_ the borders of the state itself:

![A state "Off" with substates A and B](compound-state.svg)

Here, the state called **Off** is a compound state.  It has two states **A** and **B** as its substates.  Note how the substates constitute their own state machine, even with an [initial state](initial-state.html){:.glossary}.

In UML, compound states are called _composite states_.

## SCXML

In Statechart XML, a compound state is any state with nested state elements as direct children; this includes `<parallel>`, `<initial>` elements too, as these are also state elements. 

``` xml
<state id="off">
  <state id="A"/>
  <state id="B"/>
</state>
```

## xstate

An xstate compound state is declared using the `states` property of the state, holding an object containing substates.  Each key value pair declares the name and definition of the state, respectively:

``` javascript
"off": {
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
