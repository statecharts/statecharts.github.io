---
title: Internal event
oneliner: An event caused by the statechart itself, and handled immediately
---

# Internal Event

An internal event is a [generated event](generated-event.html){:.glossary} that is generated when a [transition](transition.html){:.glossary} occurs.  When processing an external [event](event.html){:.glossary}, the statechart might go from state A to state B; this state change can "generate" new events such as

* We're no longer 'in' state A
* State A was exited
* State B was entered
* We're now 'in' state B

Immediately after a state transition happens (and importantly before the next external event is processed), the state machine checks if any transitions get "enabled" by any such internal events.  If there are any, then they are considered _triggered_ and those transition happen immediately.


## Notation

Internal events don't have specific names; the events themselves are generated automatically by the statechart.  However, sensing (reacting to) an event is done by way of transitions that specify events such as `entered(somestate)` or `in(somestate)`.

```
       in (somestate)
   ———————————————————————>
```


```
         entered (B)
   ———————————————————————>
```


## SCXML

SCXML only supports `In(state)` guards.

As a side note, SCXML automatically generates `done.stateID` events whenever a [compound state](compound-state.html){:.glossary} reaches its [final state](final-state.html){:.glossary}, and various `error.` events as part of the processing of an event.

## XState

XState only supports `in: 'state'` guards defined on the transition.
