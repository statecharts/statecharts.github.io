---
title: Parallel State
oneliner: A compound state that divides its substates into separate state machines that all get to be active at the same time
keywords:
  - orthogonal
  - orthogonal state
  - and state
breadcrumbs:
  - id: state
    name: State
  - id: compound-state
    name: Compound state
aka:
  - title: Orthogonal state
    url: parallel-state.html
    oneliner: Another name for parallel state
  - title: And state
    url: parallel-state.html
    oneliner: A state whose substates are all active, i.e. a AND b AND c, known as a parallel state
---

# Parallel state

_Also known as **Orthogonal state** and **And state**_

A parallel state is a [state](state.html){:.glossary} that is divided into separate regions. Each region contains more substates. When a parallel state is entered, _each_ of the regions are also entered; their [initial states](initial-state.html){:.glossary} are entered and so on. When a machine is _in_ a parallel state, _all_ of its regions are active.

![An example of a parallel state](parallel.svg)

If the state above is entered, both B and D states are entered too. As you can see the _flick_ event is handled by both B _and_ D. If the _flick_ event happens, _both_ B and D get to "handle" the event, and the resulting state is C _and_ E. Note: It is not possible to send an event specifically to a single region.

If another _flick_ event happens E will transition back to D, while C will ignore the event, since C doesn't handle the event. After 1 second, C will transition back to B, ready to handle the _flick_ event again.

## Notation

A parallel state is like any other state, but it is subdivided into regions by way of straight, dashed lines. Each such region can then include states.

![A state with four regions](parallel-notation.svg)

Each of those regions can hold their own sets of states

## Usage

Parallel states are used when the machine needs to combine several discrete behaviours at the same time.

Without parallel states, modeling a set of four independent on/off switches (e.g. four independent toggle buttons with _on_ and _off_) would require 16 atomic states (`1on2on3on4on`, `1off2on3on4on`, `1on2off3on4on`, etc.) and 64 transitions (!) to be able to model all possible transitions. Increasing the data model from four to five toggle buttons _doubles_ the number of states (32) _and_ transitions (128).

With parallel states, modeling the same set of four independent on/off-switches requires only eight states (four _on_ states and four _off_ states) and eight transitions (each state transitions to its counterpart). Increasing the data model from four to five toggle buttons increases the number of states and transitions by a fixed amount (two each).

When events are completely independent of one another, parallel states shine. But by using [in guards](guard.html){:.glossary} it is possible to coordinate the different regions, and have states in one region _wait_ until another region reaches a particular state or raises an event. This makes it possible to model only partially independent behaviours using parallel states.

## SCXML

In Statechart XML, [the `<parallel>` element](https://www.w3.org/TR/scxml/#parallel) declares a parallel state. It has more or less exactly the same set of attributes and elements as the `<state>` element, except it has no _initial_ or _final_ states. The various _regions_ are defined by way of the direct child `<state>` elements.

This is a parallel state with two _regions_. When `p` becomes active, so does `foo1` and `bar1`

```xml
<parallel id="p">
  <state id="region1">
    <state id="foo1" />
    <state id="foo2" />
  </state>
  <state id="region2">
    <state id="bar1" />
    <state id="bar2" />
  </state>
</parallel>
```

## XState

In XState, the state node must have `type: 'parallel'` (as of version 4.0) specified for a state to be marked as [a parallel state with regions](https://xstate.js.org/docs/guides/parallel.html). A parallel state can not define an `initial` property, since all regions are entered simultaneously.

```
p: {
  type: 'parallel',
  states: {
    region1 : {
      initial: 'foo1',
      states: {
        foo1: {}
        foo2: {}
      }
    },
    region2 : {
      initial: 'bar1',
      states: {
        bar1: {}
        bar2: {}
      }
    }
  }
```
