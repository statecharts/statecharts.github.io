---
title: Internal event
oneliner: An event caused by the statechart itself, and handled internally
---

# Internal Event

An internal event is an event that is caused by the statechart itself, especially when the state changes.  When processing an external [event](event.html){:.glossary}, the statechart might go from one state to another; this state change is itself an internal event, which the statechart can "listen" for and process like any other event.

Internal events are typically implemented as [automatic transitions](automatic-transition.html){:.glossary} with a [guard](guard.html){:.glossary} specifying that the transition should not happen unless the statechart is _in_ a specific state.

Immediately after a state transition happens (and importantly before the next external event is processed), the state machine checks if any automatic transitions are now "enabled" by the new set of active states.  If there are any, then they are considered _triggered_ and the transition happens.

Internal events don't have a notation, they are somewhat of an implementation detail.  Various statechart systems have different ways of expressing internal events:

* SCXML and xstate allow `in`-type guards, that are checked immediately after a state transition happens
* SCXML sends `done.stateID` events whenever a [compound state](compound-state.html){:.glossary} reaches its [final state](final-state.html){:.glossary}

