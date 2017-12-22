## State Machine: State Explosion

The main problem hampering wide usage of state machines is the fact that beyond very simple examples, state machines often end up with a large number of states, a lot of them with identical transitions.

A classic example is that of a user interface element that might be modeled as being _valid_ or _invalid_ and have a state machine associated with those two states.  Actions might be associated with those two states.

/* insert picture of simple valid / invalid state machine */

If you wanted to add another "boolean" e.g. _enabled_ and _disabled_ to this, you're competing with the valid/invalid states, and you end up with four states: _valid/enabled_, _invalid/enabled_, _valid/disabled_, and _invalid/disabled_.

/* insert picture of simple valid / invalid / enabled / disabled state machine */

Four states isn't such a big problem, but if you start adding more states, e.g. a dirty bit to indicate that the user has made a change to the field, you end up with _valid/enabled/unchanged_ and a total of 8 states, and a lot of duplication.  Some states might also not make sense to model; perhaps an unchanged field should not be considered invalid; then you have to document why the _invalid/enabled/unchanged_ state doesn't exist, and that it wasn't just "forgotten"

/* insert picture state explosion */

This is referred to as the "state explosion" of state machines, because adding a new aspect to the state machine can sometimes double the number of states that need to be modeled.

Statecharts address this problem by way of hierarchy and parallel states.  In a statechart you can model the aspects as individual substates as it sees fit.

/* insert picture of a statechart that models the same as above */

