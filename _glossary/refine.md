---
title: Refine
oneliner: The conversion of an atomic state to a compound state by the addition of substates.
aka:
  - title: Specialise
    url: refine.html
    oneliner: An other term for refine, the introduction substates to modify the behaviour of a state
---

# Refinement

**Also known as _specialise_**

Refinement of a state refers to the process of converting an [atomic state](atomic-state.html){:.glossary} to a [compound state](compound-state.html){:.glossary} by introducing substates.  This is done to change the behaviour of the state in question, typically by virtue of the substates handling (and therefore consuming) some, or all events before the refined state.

## Example

For example, a state A could react to the event ε1 by transitioning to the state B, and react to the event ε2 by transitioning to state C .  If it is desirable that the ε2 transition to state C should only be valid after, say, one second, the atomic state A can be converted to a compound state A by introducing a couple of substates.  The ε2 event from A to C could then be moved to one of those substates.

The act of introducing these substates to change A's behaviour, is called a _refining_, or _specialising_ state A.

Both substates can be called be _refinements_, or _specialisations_ of state A.
