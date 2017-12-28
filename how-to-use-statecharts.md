## How to use statecharts

To start using a statechart, the tangled mess that might be your component and its behaviour need to be disentangled: The _what_ needs to be separated from the _why_.  You should end up with a business object that exposes functions that each does one useful part.

The communication between this business object happen in three distinct ways, and they usually execute in this order:

- Your object tells the statechart about an [*event*](glossary/event.html)
- The statechart asks the world about some thing, known as a [*guard*](glossary/guard.html)
- The statechart tells your object to perform some [*action*](glossary/action.html)

These are the three touchpoints between the statechart and the outside world (your component).  Statecharts fit into an event driven system.  It accepts events, and turns them into actions.


## 

