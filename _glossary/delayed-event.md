---
Title: Delayed event
---

# Delayed Event

A delayed event is the ability for the statechart to send an event after a certain period of time.  Delayed events can be used to simulate [delayed transitions](delayed-transitions.html){:.glossary}.

## Notation

Not sure

## SCXML

A delayed event is specified using the following syntax:

```xml
<send event="my_event" delay="5s"/>
```

The `delay` attribute specifies a CSS timing value.  The statechart implementation will raise the specified event after the amount of time.  It is possible to _cancel_ such a delayed event.  In order to do so, an identifier needs to be added to the `<send>`

```xml
<send id="my_timeout" event="my_event" delay="5s"/>
```

To cancel, use the identifier in a `<cancel>` element:

```xml
<cancel sendid="my_timeout"/>
```

These operations are typically done in entry or exit handlers, but can also be used in transitions.

### Simulating delayed transitions

Delayed transitions are not part of Statechart XML.  Instead, you have to specify to send a delayed event, and a normal transition that handles that event.

For a simple delayed transition from `some_state` to `some_other_state` after 5 seconds, you need:

* An entry handler that send a "fake" event `my_event` with a 5 second delay
* An exit handler that cancels the sending of the event (in case the state is exited before 5 seconds)
* A transition that handles the "fake" event by transitioning to the `some_other_state`.

Care must be taken to ensure statechart-wide unique values for the event and id, because there is no "local" scope.

This is the result:


```xml
<state id="some_state">
  <onentry>
    <send id="my_timeout" event="my_event"  delay="5s"/>
  </onentry>
  <onexit>
    <cancel sendid="my_timeout"/>
  </onexit>
  <transition event="my_event" target="some_other_state" />
</state>
```
