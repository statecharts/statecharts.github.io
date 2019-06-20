---
category: benefits
description: A benefit of using statecharts is that it is easier to identify more states than otherwise.  Especially error states are highlighted, as are shorter in-between states.
---


## All states are explored

When the behaviour of a component is defined by way of a statechart, it often happens that various "in-between" states are exposed, in a way that is often missed when the behaviour of a component is built into the component itself.

Consider a simple UI component that allows the user to type something in one field, while showing some information about what is typed somewhere else.  A simple model of this might include just two states: _user typing_, and _showing some results_, and a simple implementation of such a component might indeed include a boolean "hasResults" that embodies just that.  A UX designer might design only those two states and think they're done.

A statechart based approach to this would model the behaviour independent of the business logic.  The statechart focuses on the events and the actions: Which events trigger which actions.  In practice, the discovery of "waiting states" is quite common; e.g. the state between the machine asked for some data and the data was ready; a "loading" state.

Additionally, it is easier to model error states: When loading something, what happens if an error occurs?  A new "error" state is easily introduced, which inherently runs all of the relevant "exit" handlers of any active states.

Finally, it is relatively easy to introduce new states based on additional behavioural requirements. For example, if grabbing some data exceeds a certain amount of time, one might code the UI to show a _different_ loading indicator, one that indicates to the user that "things are taking an especially long time".

The point is that the mere act of writing down these states and how they fit together helps to discover a lot of these waiting states; this means that they get to be designed, tested, etc.

### Sources

When NASA used the Statechart Autocoder to build the software for the Mars Science Laboratory (the Curiosity Rover), one of the reported benefits of using Statecharts was that "it forced developers to consider off nominal scenarios".

### References


