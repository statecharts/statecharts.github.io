---
title: Enter
oneliner: A state becomes an active state in a running state machine
redirect_from:
  - "/glossary/entry.html"
---

# Enter

Refers to the act of _entering a state_ during the execution of a state machine. The state machine keeps track of which state is active and its behaviour is defined based on the active state(s). A state may declare entry [actions](action.html){:.glossary}, which will be executed when a state is entered.

If a state is a [compound state](compound-state.html){:.glossary}, the defined [initial state](initial-state.html){:.glossary} is also entered, since in an active compound state, exactly one substate must also be active.

If a state is a [parallel state](parallel-state.html){:.glossary}, each region and their initial states will also be entered.

Entry of a state is defined to be instantaneous for all practical purposes; this includes the execution of any entry actions, and the entry of all substates.  In other words, a state can never be "half entered" or "half active".
