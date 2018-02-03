---
title: Entry
oneliner: A state becomes an "active" state in a running state machine
---

# Entry

Entry refers to the act of _entering a state_ during the execution of a state machine.  The state machine keeps track of which state is _active_ and its behaviour is defined based on the active state(s).  A state may declare entry [actions](action.html){:.glossary}, which will be executed when a state is entered.

If a state is a [compound state](compound-state.html}{:.glossary}, the defined [initial state](initial-state.html){:.glossary} is entered.

If a state is a parallel, each region and their initial states will also be entered.

Entry of a state is defined to be instantaneous for all practical purposes; this includes the execution of any entry actions, and the entry of all substates.

## Notation

There is no notation associated with the actual entry of a state, since it happens during a statechart's execution.
