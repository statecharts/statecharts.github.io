---
title: Guard
---

## Guard

A guard is something that may be checked when a statechart wants to handle an [event](event.html){:.glossary}.  A guard is declared on the [transition](transition.html){:.glossary}, and when the event that would trigger the transition happens, the guard (if any) is checked.  If the guard is _true_ then the transition happens. If the guard is false, the transition is ignored, and the next transition that handles the same event will continue processing the event..

A guard is generally a boolean function or boolean variable.  It must be evaluated _synchronously_ — A guard can for example not wait for a future or promise to resolve.

A guard function must not have any side effects.  Those are reserved for [actions](action.html){:.glossary}.  Likewise, a unit test that verifies a statechart's behaviour should _not_ require a guard function to be called; but simply set up guard functions (or variables) so that they might be called and return the values as defined in the test itself.

A guard function is de facto a part of the API surface between the component and the statechart.  A component will typically expose a set of things that the statechart is allowed to check.

Guard functions are often called _while processing an external event_ so this must obviously be possible.  However, the statechart should be allowed to check any guard at any time, i.e. also while _not_ processing any event.  This is to allow the author of the statechart to be free to use things like [delayed events](delayed-event.html){:.glossary}.

### Notation

A guard is added after the event name, in square brackets, like so:

    some-event [ is_capable_of_flight() ]

### SCXML

In Statechart XML, the guard is specified using the `cond` attribute on the `<transition>` element:

    <transition event="some-event" cond="is_capable_of_flight()" target="some-other-state" />


Again, the set of guard functions available to the statechart is up to you, and again you can expose low level information from your component (such as character count), or higher level, more "business related" guards (such as "is valid" or word count).
