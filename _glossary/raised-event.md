---
title: Raised event
oneliner: An event generated explicitly by the statechart
---

# Raised Event

A raised event is a type of [generated event](generated-event.html){:.glossary} that is explicitly mentioned in the statechart.  A raised event is usually defined as an [entry](enter.html){:.glossary}, [exit](exit.html){:.glossary}, or [transition](transition.html){:.glossary} action.

## Notation

A raised event is usually shown in the same manner as actions, e.g. `entry / B`, which would mean that if this state was entered, the system would _generate_ the event `B` and process it as part of the current event, before processing any external events.

## Usage

Raising events can be used as a way to coordinate different parts of a statechart.  For example. exiting one state can trigger another transition in a different part of the statechart.

## SCXML

In SCXML, an event can be raised using the `<raise>` element, wherever you can place so-called executable content:

```xml
<onentry>
  <raise event="B"/>
</onentry>
```

## XState

In XState, an event can be raised by specifying the reserved action type `xstate.raise`

```
onEntry: {
  type: 'xstate.raise',
  event: 'B'
}
```
