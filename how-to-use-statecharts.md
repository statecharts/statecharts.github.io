## How to use statecharts

To start using a statechart, the tangled mess that might be your component and its behaviour need to be disentangled: The _what_ needs to be separated from the _why_.  You should end up with a business object that exposes functions that each does one useful part.

The communication between this business object happen in three distinct ways, and they usually execute in this order:

- Your object tells the statechart about an *event*
- The statechart asks the world about some thing, known as a *guard*
- The statechart tells your object to perform some *action*

These are the three touchpoints between the statechart and the outside world (your component).  Statecharts fit into an event driven system.  It accepts events, and turns them into actions.

### Events

An event is something of significance that happens in your domain that you have decided you want to influence behaviour.  What actually constitutes an event depends on you.  If you have a text field, you might have very specific events such as "user typed a key" or "user pasted some text" or simply use the "onchange" event (like in the browser).

There's nothing to stop you from making more high level events, such as it "becomes empty" or "becomes non-empty", or even "becomes valid" or "becomes invalid".  Making higher level events might cause the statechart to become simpler since it doesn't necessarily have to deal with the nitty gritty of checking everything everywhere.  Experience will guide you.

### Guards

A guard is a side-effect free, synchronous call from the statechart to the "outside world" which the statechart may do to figure out what it's supposed to do.  A component will typically expose a set of things that the statechart is allowed to check.

Again, the set of guard functions available to the statechart is up to you, and again you can expose low level information from your component (such as character count), or higher level, more "business related" guards (such as "is valid" or word count).

The point is that the statechart should be able to call these guards any number of times, at _any_ time, in _any_ order, or not call them at all.  These calls, or lack of calls should _not_ have any side effects.  Similarly, a unit test that verifies a statechart's behaviour should _not_ require a guard function to be called; but simply set up guard functions so that they might be called and return the values as defined in the test itself.  Guards may be called as part of processing an event, but it must also be possible to check the guards outside the event processing.  If the statechard declares a delayed event, for example, this will trigger a guard check outside an "event" processing cycle.

### Actions

The actions are the main reason that the statecharts are here.  The main point of introducing a statechart is for the _actions_ to be invoked at the right times, depending on the sequence of events and the state of the guards.

Actions should in general be asynchronous in nature, and if the action leads to some long running _activity_, then that activity should communicate its results by way of further _events_ and/or guard functions.

An example of an action might be to _enable_ a text field; such an action is of course synchronous, but it is also practically instantaneous.

Another example of an action would be to make an HTTP request.  This would of course be an asynchronous action, and might result in guards functions responding differently, and trigger events that the statechart might be interested in.

Actions are often used to start and stop _activitites_.  An activity is the term used for whatever long running process that might be running when a statechart is _in a particular state_.'
