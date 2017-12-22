## What is a statechart?

A statechart is a [state machine](what-is-a-state-machine.html) where each state in the state machine may define its own _subordinate_ state machines, called _substates_.

- When a state is entered, its sub state machine starts and therefore, a substate is entered
- When a state is exited, its sub state machine is exited too, i.e. any substates also exit

This happens in addition to normal state machine behavior, namely entry and exit actions.

Like state machines, statecharts also react to events; events are _dealt with_ by the states and the main side effects are specified by what happens upon entering and exiting states.

Statecharts aren't restricted to just two levels; a statechart is a hierarchical structure, much like a file system or Object Oriented inheritance or prototype hierarchies.

Note also that a state may define several independent subordinate state machines; in this scenario, when a state is entered, then _all_ of the subordinate state machines "start" and enter their initial state.  In the statechart terminology, this is called a "parallel" state

