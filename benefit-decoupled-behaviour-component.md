## Using Statecharts decouples behaviour from components

When a statechart drives the behaviour of a component, it makes it possible to _separate_ the code into two separate modules.  The code of the component can be much more focused on how things are _executed_ rather than _the why_ of things are the way they are.  This means that the behaviour (when things happen, encoded in the statechart) can more easily be separated from the how (what happens, encoded in the component).

This in itself can be beneficial, since it follows a _separation of concerns_; one component embodies how business logic is executed, while the other component encodes the rules as to what happens when, i.e. which sequence of events cause that business logic to happen.

This separation has a few desirable properties:

* [Easier to reason about the code](benefit-reason-about-code.html)
* [Behaviour can be tested independently of the component](benefit-testable-behaviour.html)
