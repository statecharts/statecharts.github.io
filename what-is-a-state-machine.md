---
sitemap:
  lastmod: 2017-12-25
  priority: 0.4
---
## What is a state machine?

Wikipedia defines _finite state machines_ (FSM) as:

> an abstract machine that can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some external inputs; the change from one state to another is called a transition. An FSM is defined by a list of its states, its initial state, and the conditions for each transition.

And further:

> A state is a description of the status of a system that is waiting to execute a transition.

For our purposes (explaining Statecharts), a state machine is a software component that defines:

- The machine is defined by a finite list of states.
- One state is defined as the *initial* state.  When a machine is "started" it automatically enters this state.
- States can define "events" that trigger a *transition*.
- A transition causes the machine to exit the state and enter another (or the same) state.
- A transition may be conditional, in other words might ask "the world" about things.  These are called _guards_ and must be side-effect free.
- A state can define *actions* upon entering or exiting a state.  These are called actions and will typically have side effects.

When "running" a state machine, the state machine definition is "executed":

- The state machine enters the "initial state".
- Events are passed to the state machine.
- The state machine is free to check any guards at any time.
- The state machine' side effects are the actions that happen when states are entered / exited.
- The state machine handles a state transition as an instantaneous, atomic happening; a state machine is never _between_ states.

When looking at a state machine from the outside, the "publicly visible" parts of a state machine are:

- The events that the machine understands
- The guards that the machine checks
- the actions that the machine performs

Importantly, the _state_ that the machine happens to be in is _not_ something that needs to be publicly visible.

### Further reading

* [An example state machine](on-off-state-machine.html) — see some of these concepts in action 
* [What is a statechart?](what-is-a-statechart.html) — build on the knowledge of state machines
