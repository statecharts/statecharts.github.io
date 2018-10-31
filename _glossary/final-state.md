---
title: Final state
oneliner: a helper state which designates that its parent state has completed
breadcrumbs:
  - id: state
    name: State
---

# Final State

A final state is a state in a [compound state](compound-state.html){:.glossary} that designates that the compound state in question has completed, i.e. will not process any further events.  Reaching a final state can generate an internal event, which in turn can allow other parts of the state machine to react to the fact that the compound state has "completed".

The "completion" of a state is wholly defined by the statechart itself.  

## Notation

Final states are depicted using a solid filled circle, like the [initial state](initial-state.html){:.glossary} with an additional circle enclosing it.  Transitions from the final state must be [automatic], in other words they can not rely on events.


## SCXML

In SCXML, the `<final>` element is used to define a final state.  When a final state is reached, the parent state generates a `done.state.<ID>` (where `<ID>` is the state of the parent state).  This allows the statechart to react to those events, effectively mimicing transitions upon the "completion" of states.

## XState

In XState, final states are defined with `type: "final"`:

```js
resolved: {
  type: 'final';
}
```

See [xstate.js.org/docs/guides/final](https://xstate.js.org/docs/guides/final/) for more information.
