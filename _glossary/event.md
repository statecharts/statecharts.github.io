---
title: Event
---

# Event

An event is an external signal that something has happened.  They are sent to a state machine, and allow the state machine to react.  It is the primary driver of the state machine.

An event is something of significance that happens in your domain that you have decided you want to influence behaviour.  What actually constitutes an event depends on you.  If you have a text field, you might have very specific events such as "user typed a key" or "user pasted some text" or simply use the "onchange" event (like in the browser).

There's nothing to stop you from making more high level events, such as it "becomes empty" or "becomes non-empty", or even "becomes valid" or "becomes invalid".  Making higher level events might cause the statechart to become simpler since it doesn't necessarily have to deal with the nitty gritty of checking everything everywhere.  Experience will guide you.

## When an event happens

When an something important happens "in the real world", it becomes an _event_ in statechart parlance when the statechart is _told_ about what just happened. Often this is reduced to a simple string representation, corresponding to the _events_ defined in the various states of the statechart.

When the statechart receives the event, the active states are checked to see if they "handle" the event, in the sense that "any arrows (transitions) point from those states to other states" with a corresponding label.  If there is such a transition, that transition also _happens_ and the statechart is "instantly" in the that new state, and the event processing is _completed_.

## Notation

Since an event is bound to the transition it sets off, the name of the event is written as the caption of the transition:

            my_event
    ----------------------->

## xstate

In xstate, an event is specified as a key of the `on` property in any state.  The event name is the key, and the target of the transition that the event would trigger is the value of the event.

```json
"somestate": { 
  "on": {
    "my_event": "otherstate"
  }
}
```

## SCXML

The event is named as the `event` attribute of the `<transition>` element:

```xml
<state id="somestate">
  <transition event="my_event" target="otherstate" />
</state>
```

