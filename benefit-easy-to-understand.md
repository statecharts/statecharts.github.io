---
category: benefits
---

# Easy to understand

Once a developer gets past the initial hurdle of understanding statecharts, understanding a component whose behaviour is encoded in a statechart is a lot easier.

When trying to understand traditional components, you have no choice but to dive into the code.  The code is a mix of behaviour and side effects, structured in various ways, be it functional, procedural or object oriented, callback-based or promise-based.

When trying to understand a statechart based component, you have the choice of looking at a statechart, or a representation thereof, to understand the behaviour in isolation.  You can look at the remaining code (the guards and actions) to understand how each of those work too.  Put simply: There is a usable _method_ to understand code that uses the statechart approach.

## Diagrams

The original statechart paper by Harel described only a _diagram_ and ways of depicting statecharts as pure drawings.  It is a good idea to take whatever statechart representation available, and produce _actual drawings_ of the coded statecharts.  It is a form of the Don't Repeat Yourself rule: Keep a single authoritative representation of a piece of knowledge in the system and derive others from it.  When diagrams are included in this set of generated representations, it makes statecharts a _lot_ easier to understand.

## Sources

NASA's JPL said that it was "easier to show a statechart to a systems engineer, than a bunch of C code" and that helped people that "haven't been with the [...] project throughout the cycle"

> Code reviews for the modules constructed using a bottom-up approach were difficult and time consuming. Design and code reviews of the statechart modules were quick and effective because the software could be understood by reviewers.
>
> Constructing the User Interface with Statecharts, Ian Horrocks, page 200
