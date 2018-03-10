# Microinteractions

TK Intro to  microinteractions


## Complexity creep

Microinteractions, as you can imagine, can quickly lead to increased complexity in a UI.  You need to keep track of which microinteractions are valid at any point intime. When the user sends one of the many possible signals, you need to determine which interaction the user is starting, provide feedback to the user at the right time, allow the interaction to be interrupted, and so on.  The list goes on.

We can try to describe how one could model some microinteractions using Statecharts.  This should show how a solution based on a Statechart makes it relatively easy to add microinteractions without sacrificing the maintainability of the code base.

## The microinteractions

TK describe some desired microinteraction e.g. the "search in flickr":

* When an image is clicked, have it zoom into place, not just "appear"
* When a user clicks "search", and the search takes more than 0.3 seconds, then show a progress indicator
* If the progress indicator shows, show it for at least 0.5 seconds, even though the results arrive earlier.

TK provide a link to this as being "good"

## Modeling the interaction

TK Start off with a model of a statechart based piece of code, e.g. the "search in flickr" codebase from how-to-use-statecharts.html


