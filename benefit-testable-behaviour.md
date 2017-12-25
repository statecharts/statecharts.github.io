## Testable behaviour

When behaviour is properly separated into a statechart, the statechart itself encapsulates the "when" and "why" of any business logic that a component would need.  The statechart interacts with the world by way of

- events (things that "happen" in the world that the statechart may or may not react to)
- guards (synchronous calls to the outside world on if a condition holds true or false)
- actions (asynchronous calls to tell the outside world to _do_ something)

In addition, statecharts also have a concept of timing, or _delayed events_ e.g. a state can choose to send an event after a certain amount of time has elapsed.

This is all easily stubbed, 
