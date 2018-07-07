---
title: Initial state
oneliner: The state which is entered when a state machine starts
breadcrumbs:
  - id: state
    name: State
---

When a state machine starts, it starts by [entering](entry.html){:.glossary} the defined initial state.  Likewise, when a [compound state](compound-state.html){:.glossary} is entered, it also generally causes its initial state to be entered.

# Notation

A state machine, or compound state's _initial_ state is specified by way of an arrow (a [transition](transition.html){:.glossary} arrow) from a black circle to the initial state, but without annotations like event names or guards.

![Black circle pointing to a state labeled A.  A is the initial state.](initial-state.svg)

## xstate

In xstate, a state must have the `initial` property declaring the name of the initial state.

```js
{
  "initial" : "A"
  "states" : {
    "B": {},
    "A": {}
  }
}
```

## SCXML

In Statechart XML, the initial state is specified in one of these ways:

* using the `initial` attribute of the `<state>` element:
  ```xml
  <scxml initial="A">
    <state id="B"/>
    <state id="A"/>
  </scxml>
  ```
* Using the `<initial>` element instead of a `<state>` element.  The `<initial>` element is identical to any other `<state>` except that it is an `<initial>` state.
  ```xml
  <scxml>
    <state id="B"/>
    <initial id="A"/>
  </scxml>
  ```
* Implicitly, by relying on document order, the first `<state>` element will be the initial state:
  ```xml
  <scxml>
    <state id="A"/>
    <state id="B"/>
  </scxml>
  ```
