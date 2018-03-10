# Microinteractions

TK Intro to  microinteractions


## Complexity creep

Microinteractions, as you can imagine, can quickly lead to increased complexity in a UI.  You need to keep track of which microinteractions are valid at any point intime. When the user sends one of the many possible signals, you need to determine which interaction the user is starting, provide feedback to the user at the right time, allow the interaction to be interrupted, and so on.  The list goes on.

We can try to describe how one could model some microinteractions using Statecharts.  This should show how a solution based on a Statechart makes it relatively easy to add microinteractions without sacrificing the maintainability of the code base.

## The microinteractions

TK describe some desired microinteraction e.g. the "search in flickr":

* Provide immediate feedback to the user that search was clicked, e.g. by clearing the search results, perhaps change the word "Searching" to the button, if that's not done.
* Add a progress indicator when a user clicks "search"
* Only show the progress indicator if it takes more than 1 seconds, then show a progress indicator
* If the progress indicator shows, show it for at least 0.3 seconds, even though the results arrive earlier, this is to avoid flickering
* If it takes more than 5 seconds, add a note saying that it seems to be taking a long time.

These are good practices for 

## Modeling the interaction

TK Start off with a model of a statechart based piece of code, e.g. the "search in flickr" codebase from how-to-use-statecharts.html

- Add the actions or activities, and make the statechart go through the states one by one after 1 second or so, just to give an idea of what they look like

- Then build out the Statechart, adding states to solve problems along the way.
