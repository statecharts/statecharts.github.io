---
title: Event
---

# Event

An event is an external signal that something has happened.  They are sent to a state machine, and allow the state machine to react.  It is the primary driver of the state machine.

An event is something of significance that happens in your domain that you have decided you want to influence behaviour.  What actually constitutes an event depends on you.  If you have a text field, you might have very specific events such as "user typed a key" or "user pasted some text" or simply use the "onchange" event (like in the browser).

There's nothing to stop you from making more high level events, such as it "becomes empty" or "becomes non-empty", or even "becomes valid" or "becomes invalid".  Making higher level events might cause the statechart to become simpler since it doesn't necessarily have to deal with the nitty gritty of checking everything everywhere.  Experience will guide you.

## Notation

Since an event is tightly coupled to the transition it sets off, the name of the event is written as the caption of the transition:

            my_event
    ----------------------->

## SCXML

The event is named as the `event` attribute of the `<transition>` element:

    <transition event="my_event" .../>

