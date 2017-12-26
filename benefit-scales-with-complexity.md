## Scales well with increased complexity

A statechart has an inherent ability to hide complexity by being able to "zoom out" to show only the higher level (outer) states, and "zoom in" to focus on one state and its substates.

/* picture of complex statechart, zoomed in, and zoomed out */

### Sources

Harel calls the states that include substates _abstractions_ of the substates, using this as the reasoning for "zooming out" and "zooming in".

NASA's JPL says that "what looks like a simple state machine grows larger when off-nominal is added". 
