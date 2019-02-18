---
title: Initial state
oneliner: The state which is entered when a state machine starts, or when a compound state is entered
primaryImage: initial-state.svg
keywords: initial, starting state, start state
breadcrumbs:
  - id: state
    name: State
  - id: pseudostate
    name: Pseudostate
---

When a state machine starts, it starts by [entering](enter.html){:.glossary} the defined **initial state**.  Likewise, when a [compound state](compound-state.html){:.glossary} is entered, _its_ **initial state** is also entered.  The initial state is not a separate state, but more like an indication of which state that the machine should _start_ in by default.

A [transition](transition.html){:.glossary} from a different state can target a substate of a compound state, thereby bypassing the state's initial state.  An initial state should be thought of as the default starting point of a compound state.

# Notation

A state machine, or compound state's _initial_ state is specified by way of an arrow (a transition arrow) from a filled black circle to the initial state, but without annotations like event names or guards.

![Black circle pointing to a state labeled A.  A is the initial state.](initial-state.svg)

## XState

In XState, a compound state must have the `initial` property declaring the key of the initial child state node.

```js
{
  "type": "compound", // optional
  "initial" : "A",
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
