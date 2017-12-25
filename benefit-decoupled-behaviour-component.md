## Using Statecharts decouples behaviour from comoponents

When a statechart drives the behaviour of a component, the code of the component can be much more focused on how thinsg are _executed_ rather than _the why_ of things are the way they are.  This causes the behaviour (when things happen, encoded in the statechart) to be separted from the how (what happens, encoded in the component).

This separation has a few desirable properties:

* [Easier to reason about the code](benefit-reason-about-code.html)
* [Behaviour can be tested independently of component](benefit-testable-behaviour.html)

