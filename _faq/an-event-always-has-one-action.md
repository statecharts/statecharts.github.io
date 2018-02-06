---
title: My UI is simple: Do I really need statecharts if my events always lead to specific actions?
---

# My UI events always lead to specific actions, do I need statecharts for that?

Because if you think harder about it, an event will usually have some deviation from doing that action.  Most buttons are clickable, and when you click it, then you perform the action. However, some users doubleclick most buttons, and in those cases, _rarely_ do you want to repeat that action.  So if you have a click handler that starts a HTTP request, then you _will_ end up firing two HTTP requests at the same time.

Think about the cases where you might have disabled the button, or just cleverly obscured it so that it's not clickable, because perhaps it doesnt make sense.  Why is that, and what if the user (maliciously or by chance) finds a way to click the button?  Why should the button-click in _some_ cases perform an action, and _other times_ not?

Also, if you think even harder about your UI, you will probably find that there are a lot more cases.  I already mentioned the first one.  Given a simple UI, such as a search UI, where the "search button" **always** causes a HTTP request to be made:

* If the user clicks search while searching
* If the user somehow cancels the search (because she realises she's offline)
* Let's say you have pagination, or infinite scroll, and page 2 is loading, and the user clicks search

In all of these cases (and probably more), ask yourself:
- What actually happens?
- What should happen?
- How easily can you change what happens?

Each of these is much easier to discover, discuss and solve, respectively, if the actions are controlled by a statechart:

- What actually happens, is described by the statechart rather than a blur of boolean logic and fields being disabled
- What should happen, can be discussed with stakeholders with the chart in front of you, rather than having to provide a complete solution in code form to show to stakeholders.
- How easily it can change is mostly a matter of making changes to the statechart alone, rather than having to change that blur of boolean logic

