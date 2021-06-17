---
title: Raised event
oneliner: An event generated explicitly by the statechart
breadcrumbs:
  - id: event
    name: Event
  - id: generated-event
    name: Generated Event
date: 2019-05-08
---

# Raised Event

A raised event is a type of [generated event](generated-event.html){:.glossary} that is explicitly mentioned in the statechart. A raised event is usually declared as an [action](action.html){:.glossary} assigned to the [entry](enter.html){:.glossary} or [exit](exit.html){:.glossary} of a state, or on a [transition](transition.html){:.glossary} between states.

## Notation

A raised event is usually shown in the same manner as actions, in other words, after a slash. For example `entry / B`, which would mean that if this state was entered, the system would _generate_ the event `B` and process it as part of the current event, before processing any external events.

## Usage

Raising events can be used as a way to coordinate different parts of a statechart. For example, exiting one state can trigger another transition in a different part of the statechart.

## SCXML

In SCXML, an event can be raised using the `<raise>` element, wherever you can place so-called executable content:

```xml
<onentry>
  <raise event="B" />
</onentry>
```

## XState

In XState, an event can be raised by specifying the reserved action type `xstate.raise`.

```
onEntry: {
  type: 'xstate.raise',
  event: 'B'
}
```
