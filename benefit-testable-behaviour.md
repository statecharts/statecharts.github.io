# Testable behaviour

When behaviour is properly separated into a statechart, the statechart itself encapsulates the "when" and "why" of any business logic that a component would need.  The statechart interacts with the world by way of

- [events](glossary/event.html){:.glossary} (things that "happen" in the world that the statechart may or may not react to)
- [guards](glossary/guard.html){:.glossary} (synchronous calls to the outside world on if a condition holds true or false)
- [actions](glossary/action.html){:.glossary} and/or [activities](glossary/activity.html){:.glossary} (asynchronous calls to tell the outside world to _do_ something)

In some cases "the world" also knows about the "current state" or perhaps [activities](glossary/activity.html){:.glossary} instead of actions.

In addition, statecharts also often have a concept of timing, or [delayed transitions](glossary/delayed-transition.html){:.glossary}, in other words, a state can specify that it should only be in a particular state for a certain amount of time.

All of these things can be tested in a concise and simple fashion:

Given a set of events that happen in a certain sequence and possibly with certain timing, you verify that actions have been called or activities have started:

```
machine = the_machine();
machine.send("INPUT");
assert(machine.activities.indexOf("search") == -1)
machine.waitFor(2000);
assert(machine.activities.indexOf("search") != -1)
```

In this pseudocode, a state machine is initialized, passed an INPUT event, and then it is asserted that the "search" activity hasn't started. Then the statechart is informed that 2 seconds pass, then we assert that the "search" activity has been started (and hasn't stopped yet).

This test has no knowledge of the internals of the state machine, how many states there were, or what other activities (e.g. showing a "loading" indicator, or a "typing" indicator perhaps) were started; this test just ensures that the state machine exhibits the behaviour that "2 seconds after INPUT, the search activity should be happening."

Also, there is no details on what the "search" activity entails, be it a HTTP request or something else; these details are not needed because of the way the statechart and the underlying components have been decoupled.
