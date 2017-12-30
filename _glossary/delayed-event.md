---
title: Delayed event
---

# Delayed event

A delayed event is an [event](event.html){:.glossary} that is sent after a period of time.  Most often, a delayed event is tied to being in a specific state for a certain amount of time.

## Notation

A delayed event uses the phrase "after <timespec>" as the name of the event

    after 3 s

## SCXML

In Statechart XML, it is a bit more verbose:  a delayed event must be given a name, and also a unique identifier.  You need to both to start and stop the timer, _and_ give it an ID.  They are and is created by way of (typically) a pair of entry and exit actions.  In addition to this you need a regular `<transition>` to handle the event:

    <state ...>
      <onentry>
        <send id="my_timeout" event="my_event"  delay="5s"/>
      </onentry>
      <onexit>
        <cancel id="my_timeout"/>
      </onexit>
      <transition event="my_event" target="some_other_state" />
    </state>


