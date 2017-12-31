# How to use statecharts

This page tries to describe some aspects of employing statecharts in your day-to-day coding routine.

## Determine scope

When you first learn about statecharts, you might get the feeling that statecharts can be used to describe the _entire_ behaviour of an application, all the way from which screens show as part of logging in, to the state of each checkbox and text field in every screen, all represented in a statechart.  That would be a statechart from hell, and an even bigger maintenance burden.  Instead, the focus should be to get a grip on the **behaviour at the component level**, whatever a component might be.  A single screen would be a component, for sure.  A single text field that might have some particular internal behaviour (e.g. it changes color based on various flags like _required_ or _invalid_) might warrant that to be wrapped in a component with a statechart to describe its behaviour.

In general, try to structure your code as you did before, by dividing things up into components.  Try to use statecharts to describe the behaviour of _each_ component in isolation.  Use events and so on to get communication between components going just like before; keep the statechart _internal_ to the component itself.  The _user_ of the component shouldn't need to know that there's a statechart within it, other than by inspecting the code or guessing (since it behaves so well).

## Distill the API between the component and the statechart

To start using a statechart, the tangled mess that might be your component and its behaviour need to be disentangled: The _what_ / _how_ needs to be separated from the _why_.  You should end up with a business object that exposes functions that each does one useful part.

The communication between this business object happen in three distinct ways, and they usually execute in this order:

- Your object tells the statechart about an [event](glossary/event.html){:.glossary} — something happening either outside or inside the component. e.g. a keystroke, or a HTTP request response arrived.
- The statechart asks the world about some thing, known as a [guard](glossary/guard.html){:.glossary} — is the text field empty, or is the HTTP response complete
- The statechart tells your object to perform some [action](glossary/action.html){:.glossary} — tell the field that it's "invalid", or start parsing the results

These are the three touchpoints between the statechart and the outside world (your component).  Statecharts fit into an event driven system.  It accepts events, and turns them into actions.

### Decoupled from the statechart itself

At this point in time I think it's very useful to point out that there are some notable things that the component _should not_ be worrying about, such as:

- _Which state is the statechart in?_ — It really doesn't matter. What matters are the actions that are called
- _Which transition just fired?_ — This too doesn't matter.

There's nothing that stops you from writing a component that inspects the state of the statechart, and then makes some decision based on this.  However, this creates an **unwanted dependency from the component to the statechart**.  If you accept this, you also accept that it becomes much more difficult to refactor or **make changes to the statechart**, since the states themselves suddenly have some extrinsic meaning.

## TBC
