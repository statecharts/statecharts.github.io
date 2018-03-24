---
category: benefits
---

# Easy to change the behaviour

Since the behaviour of a component is extracted into the statechart, it is relatively easy to make rather big changes to the behaviour of the component, compared to a component where the behaviour is embedded alongside the business logic.

For example by adding a small delay between actions and the events, but only in certain states.

Completely changing the behaviour so that actions are performed more or less at random makes little sense other than to battle-test the business logic's ability to expect the unexpected, basically _how defensively was the code written_.

But if a statechart has grown and become too difficult, it is much easier to rewrite the statechart from scratch to try to end up with a simpler overall solution.

## Sources

NASA's JPL found that statecharts were "very useful in accommodating late breaking changes"

Ian Horrocks, describes maintainability too:

> It is difficult to measure maintainability, but it is worth making the following points.  Changes to statechart modules were much quicker and easier to make than changes to other modules.  The maintainability of statechart-constructed modules remained constant.  There was no deterioration in the quality of the code, despite several significant changes to the designs.  Three modules that were constructed using a bottom-up approach were rewritten using the statechart approach because the required user interface was too complicated to develop. No statechart module needed to be rewritten.
>
> <cite>Ian Horrocks, Constructing the User Interface with Statecharts, page 200</cite>
