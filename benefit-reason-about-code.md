## Easier to reason about code

When behaviour is properly separated into a statechart, the remaining business logic is distilled into small functions or actions, each of which can be understood in isolation, without the need to understand when or why any particular function or action is invoked.  This type of code is often a lot easier to test too, since a function or action is not supposed to make judgements on other functions or actions to invoke, but rather emit _events_ that should be handled by the statechart.

The statechart itself is a polar opposite; in that it does not "do" anything; it is only designed to react to events and tell the surrounding code what to do.  But it is just as easy to reason about, and also just as easy to verify.
