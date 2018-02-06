---
title: Does using statecharts increase the number of lines of code?
---

# Does the use of statecharts result in more lines of code being written?

Quite possibly.  The use of statecharts forces a certain separation of concerns, and this itself probably increases the number of lines of thought.  However, since the concerns are separated, it is likely that less cognitive thought needs to go into each line, since it is relatively clear what type of code should be written in the different places:  A change to the behaviour goes into the statechart, while other changes go in the component.

## Bottom up approach

In a traditional "bottom up" approach to coding behaviour, a lot of thought has to be put into if a change in behaviour should result in a new flag, or if it's possible to infer when to react differently based on a combination of the flags already in place.  This is a thought-heavy process that requires a good understanding of the component and its invariants.  This takes time, and it becomes harder to do the more such a component has been maintained.

## Statechart approach

In a statecharts approach to coding behaviour, you have two parts: The actual side effect, and the new "behaviour".  One should immediately try to figure out in which states the new behaviour should be, and consider various ways of introducing the new behaviour:

* Introduce a new substate, which "overrides" the behaviour in a particular state
* Introduce new actions or activities in existing states, paired with perhaps implementations of those side effects
* Introduce new transitions, to new or existing states

These could be done in a "back of the napkin" fashion, or using a fancy visialization tool.

The other part, implementing the "side effect" becomes a lot simpler because it doesn't have to check a lot of booleans to know if it should happen or not — the statechart has that covered.  The side effect (the action or activity) essentially only needs to do the thing that it needs to do.  It also doesn't need to worry about "what should happen next" — when the activity that needed to happen is finished, it only needs to inform the statechart and let the statechart figure out what to do.

## See also:

* The fact that statecharts excel at handling [off nominal](../benefit-handle-anomalies.html) cases means that they are more often considered.  This of course leads to a higher quality of the end product, but might also increase the lines of code.
* Statecharts have a natural affordance for [canceling actions](../benefit-cancel.html) that the user (or another system) no longer wants.  This affordance can lead to developers actually implementing canceling of unwanted activities, which again leads to a more correct system, but has the price of some lines of code.

