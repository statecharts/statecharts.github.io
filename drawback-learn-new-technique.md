# Learning a new technique

One of the biggest drawbacks with statecharts is the fact that developers who work on these components are forced to understand this new paradigm, perhaps some new tools, and a certain level of buy-in in order to understand and reap the benefits.

This may of course be said to be a drawback of any technique, for example of functional programming, promises, or event driven programming.  Statecharts is rather unique since it carries along with it:

* Completely new formats — Some statecharts are written in SCXML, or something simpler like a simple JSON representation of the statechart.  Being able to work with this code requires a large mental shift.
* New refactoring techniques — In the world of statecharts, new types of problems emerge and new types of solutions need to be learned or discovered.  For example, the solution to a problem in a statechart is often to introduce a new substate, and deal with certain events in the substate.
* New documents — A statechart, being a diagram, is probably not the first place a developer will go looking.
* New debugging tools — Statecharts can be debugged independently of the business logic, but in order to do so, new debugging tools need to be used, tools that understand how a statechart functions.
* UML baggage — Many people view diagrams and drawings as toys that aren't useful. This is not the case with statecharts.  While statecharts do have academic underpinnings and have been taken up by UML, numerous examples exist of statecharts showing practical value.

Statecharts is a paradigm shift.
