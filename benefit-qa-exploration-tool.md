# Quality Assurance can use Statecharts to help with exploratory testing

A Quality Assurance process often involves a phase called _exploratory testing_, and it involves a tester or QA engineer, typically asserting the quality of a user interface, trying it out in various ways, looking for problems.  Exploratory testing is characterized by the relatively small amount of planning.  When the QA engineer is shown a graphical representation of the behaviour (the statechart) of the system under test, it functions as a map of the behaviour; a map that can be traversed.  Any state in such a statechart should be accessible, and the tester can understand from the statechart how to arrive at various states.

* The statechart can be inspected to see if there are several paths to arrive at a state; these should be possible to test
* The tester can check that all states and all transitions have been explored

## See also

* [Statecharts makes it easy to write unit tests](benefit-testable-behaviour.html) that can verify behavioural aspects.

## Sources

NASA's JPL says that "test engineers were very happy to have \[visual statecharts]", and that when writing unit tests, the developer used "a red marker and checked off every state in every transition".
