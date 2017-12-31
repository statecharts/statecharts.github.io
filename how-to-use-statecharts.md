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

### Decoupled the component from the statechart?

At this point in time I think it's very useful to point out dependency that might come creeping.  There are some notable things that the component _should not_ be worrying about, such as:

- _Which state is the statechart in?_ — It really doesn't matter. What matters are the actions that are called
- _Which transition just fired?_ — This too doesn't matter.

There's nothing that stops you from writing a component that inspects the state of the statechart, and then makes some decision based on this.  However, you should be aware that this creates a **dependency from the component to the statechart**, which in some cases is unwanted.  If you accept this, you also accept that it becomes much more difficult to refactor or **make changes to the statechart**, since the states themselves suddenly have some extrinsic meaning.

Sometimes, a statechart is only used to set a top level class attribute on a HTML element; and has no actions other than that.  A statechart still makes sense, since it ensures valid reactions to events.  In those cases, where you don't see the need to add _additional_ actions to the states, then that dependency can probably be OK.  The alternative would be to add _entry_ actions to _each state_ to _set the top level class attribute_ to the same name as the state.  This does seem like a lot of unneccessary code, but it does buy you the freedom of being able to change the statechart freely.

The reason I point this out so early on is that it is quite natural to design the statechart based on the major "modes" of the UI, like "loading", "waiting", "typing", "idle" or "error".  Those often have UI counterparts, probably with similar names, like a CSS class: `state-loading`, `state-waiting` and so on.  Since the statechart always has the right "current state" it is extremely easy to just take that state and pop it into the UI.

While I advocate against doing so, there is nothing _wrong_ with it.  In fact, if you decide to keep them decoupled, it comes at the increased cost of additional actions, and increased "API surface".  Additionally the statechart needs to have entry handlers (and possibly exit handlers) to turn on (and off) modes in the UI.  The statechart needs to be able to control _explicitly_ what was done _implicitly_ by the component inspecting the "current state".  It is merely making the implicit explicit.

## Designing a statechart

This is the biggest hurdle if you're new to statecharts, mainly because it is often such a foreign concept.  .....to be continued
