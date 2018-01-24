---
title: Statecharts go against the grain of my tech stack.  Why should I use them?
---

# Statecharts go against the grain of my tech stack.  Why should I use them?

Statecharts themselves are native only to a few tech stacks out there, and even in them, they are often an optional add-on.  Rarely do statecharts permeate the tech stack in use, and sometimes the "way things are done" in a particular stack causes confusion and make it hard to know when and why to use statecharts.

Statecharts thrive in any system that is _event driven_.  Statecharts were _designed_ back in 1987, specifically mentioning _events_ and _actions_.  So if this tech stack of yours _handles events_ and _performs actions_ based on those events, then _probably_ there is some conditional logic in the event handling itself.
