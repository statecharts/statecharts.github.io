---
title: Guard
oneliner: A boolean check imposed on a transition to inhibit the execution of the transition
---

# Guard

A guard is something that may be checked when a statechart wants to handle an [event](event.html){:.glossary}.  A guard is declared on the [transition](transition.html){:.glossary}, and when that transition _would_ trigger, then the guard (if any) is checked.  If the guard is _true_ then the transition does happen. If the guard is false, the transition is ignored.

When transitions have guards, then it's possible to define two transitions for the same event from the same state, i.e. that a state has _two_ transitions for a particular event.  When the event happens, then the guarded transitions are checked, one by one, and the first transition whose guard is true will be used, the others will be ignored.  

A guard is generally a boolean function or boolean variable.  It must be evaluated _synchronously_ — A guard can for example not wait for a future or promise to resolve.

A guard function must not have any side effects.  Those are reserved for [actions](action.html){:.glossary}.  Likewise, a unit test that verifies a statechart's behaviour should _not_ require a guard function to be called; but simply set up guard functions (or variables) so that they might be called and return the values as defined in the test itself.

A guard function is de facto a part of the API surface between the component and the statechart.  A component will typically expose a set of things that the statechart is allowed to check.

Guard functions are often called _while processing an external event_ so this must obviously be possible.  However, the statechart should be allowed to check any guard at any time, i.e. also while _not_ processing any event.  This is to allow the author of the statechart to be free to use things like [delayed events](delayed-event.html){:.glossary}.

## Critisism

It should be noted that a guard is an _if_ test, exactly the type of if tests that lead to problems and complexity in traditional event processing code.  Heavy use of guards with complicated guard conditions should be avoided.

## Notation

A guard is added after the event name, in square brackets, like so:

![An arrow with the word "some-event" followed by "is capable of flight" in square brackets](guard.svg)

The notation does not prescribe the formatting of the square brackets; it does not have to be executable code.  For hand drawn statecharts, a simple sentence is enough.

## xstate

Xstate 3 supports guard functions in the machine definition:

```
on: {
  "some-event": {
    "some-other-state": ({ is_capable_of_flight }) => is_capable_of_flight
  }
}
```

## SCXML

In Statechart XML, the guard is specified using the `cond` attribute on the `<transition>` element:

    <transition event="some-event" cond="is_capable_of_flight()" target="some-other-state" />

Again, the set of guard functions available to the statechart is up to you, and again you can expose low level information from your component (such as character count), or higher level, more "business related" guards (such as "is valid" or word count).
