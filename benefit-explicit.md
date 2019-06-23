---
sitemap:
  lastmod: 2018-02-25
---

# You're already coding statecharts, they're just implied.

The code you're writing today is already saturated with state machines and/or statecharts.  It's just that those state machines are usually just a _function of the code_.  There's no place in the code that you can point to and say "these are the different states" and "this is how the behaviour changes when this happens".  The statecharts.github.io project advocates making _explicit_ statecharts, that allow you to inspect the state machine as a separate entity.

In traditional coding styles, behaviour is often determined by way of boolean variables, or even simply by enabling and disabling, or showing and hiding UI components.  When a UI component changes like this, it can be said to be in different _states_.  This is known as an _implied_ state machine, where one has to read and understand the code in order to find out which states the code can be in, and how its behaviour is different in each of those states.

For example, here is a typical piece of UI code that, in a declarative manner, disables a button depending on some value in a model. (We're showing JavaScript here, but the concept exists in a variety of languages.)

```
<button ngIf="item.editing">
```

In the AngularJS code shown, `ngIf` declares the `<button>` should be rendered only when `item.editing` is true.  From this we can understand that the component has at least two states: _button is showing_, and _button is not showing_.  But it is not at all clear how it switches between these two states; you have to hunt down the `editing` boolean, to find out how it changes.

Another example, from the React quick start:

```
{unreadMessages.length > 0 &&
  <h2>
    You have {unreadMessages.length} unread messages.
  </h2>
}
```

The `<h2>` is rendered only when `unreadMessages.length > 0`.

Similar constructs are common in most other modern UI component frameworks.

The main problem with this approach is that complex implicit state machines become unwieldly as the number of assumptions grows.  The relationships between these assumptions remain in the form of code, in increasingly complicated conditional statements.  When the number of distinct states grows, so does the conditional logic to keep the implicit state machine behaving the way it should. For developers, more and more mental effort is required to gain an understanding sufficient to repair or elaborate the system.

Statecharts solve this by making these implicit assumptions (and the relationships between them) **explicit** in the form of a structure and/or diagram that describes each state and what it should be doing. And because statechart notation is seldom deeply coupled to a particular language or framework, it's far easier to focus on the correctness of the logic while considering refactoring or porting to a different technology.
