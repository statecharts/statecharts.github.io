## A simple "On-Off" state machine

Here is a simple state machine that includes a few of the concepts.

![A simple state machine](on-off.svg)

From this drawing, we can see that 

* This machine has two [states](glossary/states){:.glossary}, *On* and *Off*
* it _transitions_ between them whenever it gets the _flick_ event (that's the two arrows between the states)
* The "on" state has some _actions_ that happens when it *enter*s or *exit*s that state.

The machine basically functions as an on-off switch which turns a light on or off whenever it gets the "flick" event

# Further reading

* [A more advanced on-off switch](on-off-statechart.html) — adds more features to this simple switch logic
