## All states are explored

When a the behaviour of a component is defined by way of a statechart, it often happens that various "in-between" states are exposed, in a way that often is missed when the behaviour of a component is built in to the component itself.

Consider a simple UI component that allows the user to type something in one field, and that the component shows some information about what is typed somewhere else.  A simple model of this might be just two states: The user typing, and showing some results, and a simple implementation of such a component might indeed include a boolean "hasResults" that emodies just that.  A UX designer might design only those two states and think they're done.

A statechart based approach to this would model the behaviour independent of the business logic.  The statechart focuses on the events and the actions: Which events trigger which actions.  The discovery of "waiting states" is quite common; e.g. the state between the machine asked for some data and the data was ready; a "loading" state.

Additionally, it is easier to model error states: When loading something, what happens if an error occurs?  A new "error" state is easily introduced, which inherently runs all of the relevant "exit" handlers of any active states.

Finally, it is relatively easy to introduce new states based on additional behavioural requirements. For example, if grabbing some data takes a certain amount of time, one might the UI to show a _different_ loading indicator, one that indicates to the user that "things are taking a long time".

The point is that the mere act of writing down these states and how they fit together helps to discover a lot of these waiting states; this means that they get to be designed, tested, etc. 
