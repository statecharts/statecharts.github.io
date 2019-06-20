# Statecharts handle off nominal

Statecharts have a natural flare for handling error cases and "off nominal" (off the happy path) situations.

## Traditional "bottom-up" approach

In a lot of bottom-up approaches, it is common to forego the error states: When an error occurs, it's caught by a high level error handler and a generic error message is shown to the user.  The user interface is often left in an unknown state; the booleans and other variables that control the UI might be set in some unexpected way because of the error.  Errors like this are rarely sought out, they rarely appear in testing, and often cause the interface to crash or behave in unexpected ways in the field.

## Statechart approach

In a statechart approach, failures are generally failures of background [activities](glossary/activity.html){:.glossary}.  When a background activity fails, a simple thing to do is to inform the statechart about the failure, and describe _in the statechart_ how the failure should be handled, typically by introducing a new [transition](glossary/transition.html){:.glossary} to deal with the error.

This simple act causes the error to be explicitly visible in the statechart, _and_ to the development team..  This allows [QA teams to discover](benefit-qa-exploration-tool.html) that the error state exists, possibly prompting them to actually test this path.  It allows designers to design the error state [that has been uncovered](benefit-all-states-explored.html).
