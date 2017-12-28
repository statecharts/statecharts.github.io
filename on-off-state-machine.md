## A simple "On-Off" state machine

Here is a simple state machine that includes a few of the concepts.

![A simple state machine](on-off.svg)

From this drawing, we can see that 

* This machine has two [states](glossary/state.html){:.glossary}, *On* and *Off*
* it [transitions](glossary/transition.html){:.glossary} between them whenever it gets the _flick_ [event](glossary/event.html){:.glossary} (that's the two arrows between the states)
* The "on" state has some [actions](glossary/action.html){:.glossary} that happens when it *enter*s or *exit*s that state.

The machine basically functions as an on-off switch which turns a light on or off whenever it gets the "flick" event

# Further reading

* [A more advanced on-off switch](on-off-statechart.html) — adds more features to this simple switch logic
