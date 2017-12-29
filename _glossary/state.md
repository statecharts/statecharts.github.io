---
title: State
---

## State

A state in a state machine is a definition of a particular configuration of [events](event.html){:.glossary} to handle and [transitions](transition.html){:.glossary} to execute, when the state machine is _in_ that state, along with a specification of which [actions](action.html){:.glossary} to perform when the state is entered or exited.

A state in a statechart additionally holds any number of "subordinate" states, or substates, which constitute a subordinate new state machine which should be executed whenever the statechart is _in_ that state.

When a state machine is _executed_, it _enters_ the [initial state](initial-state.html){:.glossary}, and the machine reacts to the events dictated by that state by "moving" to the transition's target state.
