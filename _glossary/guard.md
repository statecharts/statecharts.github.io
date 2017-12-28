---
title: Guard
---

## Guard

A guard is a side-effect free, synchronous call from the statechart to the "outside world" which the statechart may do to figure out what it's supposed to do.  A component will typically expose a set of things that the statechart is allowed to check.

Again, the set of guard functions available to the statechart is up to you, and again you can expose low level information from your component (such as character count), or higher level, more "business related" guards (such as "is valid" or word count).

The point is that the statechart should be able to call these guards any number of times, at _any_ time, in _any_ order, or not call them at all.  These calls, or lack of calls should _not_ have any side effects.  Similarly, a unit test that verifies a statechart's behaviour should _not_ require a guard function to be called; but simply set up guard functions so that they might be called and return the values as defined in the test itself.  Guards may be called as part of processing an event, but it must also be possible to check the guards outside the event processing.  If the statechard declares a delayed event, for example, this will trigger a guard check outside an "event" processing cycle.
