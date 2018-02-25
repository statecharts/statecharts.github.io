# Using a statechart increases the number of lines of code

When you solve a problem using a statechart, it forces a certain structure upon the code.  For example, since the events should no longer directly cause side effects, the events and those side effects (called [actions](glossary/action.html){:.glossary}) might need function signatures, and simply be more "explicit".

This forced structure can increase the number of lines of code somewhat, but the resulting code generally has a lower level of complexity, meaning that it becomes [easier to reason about](benefit-reason-about-code.html).

This difference, however is most visible in smaller codebases, where one could argue that statecharts are overkill.  However, as time passes and the smaller codebase grows, a statechart based codebase will generally not grow as rapidly as that of a codebase employing a traditional solution.
