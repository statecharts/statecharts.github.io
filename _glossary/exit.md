---
title: Exit
oneliner: A state stops being an active state in a running state machine
---

# Exit

Exit refers to the act of _exiting a previously entered state_ during the execution of a state machine.  A state may declare exit [actions](action.html){:.glossary}, which will be executed when a state is exited.

If a state is a compound or parallel state, any substates are also exited.

The exit of a state is defined to be instantaneous for all practical purposes; this includes the execution of any exit actions, and the exit of all substates.

## Notation

There is no notation associated with the actual exit of a state, since it happens during a statechart's execution.
