# Statecharts in User Interfaces

Statecharts are a good fit for solving certain problems with coding user interfaces.  Both statecharts and most UI technologies are event driven, but the technologies complement one another very well.

## Event Action paradigm

Most UIs are event driven, meaning that the user interface components themselves generate events when the user interacts with them.  These events typically trigger actions attached directly to the UI components.  In some systems, the events are passed around things like component hierarchies, or forwarded to an event loop that gets to decide what _action_ to perform.  The implementation of the UI component somehow decides what to do, what to show, what to stop doing and what to stop showing.

This is called the **Event Action** paradigm, because the action is tightly coupled to the event.

Statecharts inject themselves between the event being generated and the action being performed.  A statechart's main function is to take an event created somewhere, and make a decision on _doing stuff_.  It does precisely what most event driven UIs _don't_ do, or provide a framework for.

## A comparison

In a traditional event driven user interface component, say, the ubiquitous HTML `<input>` element, the UI component generates a lot of events, that the developer can subscribe to, from gaining or losing focus, editing, selecting, mouse movement and so on.  A developer has a plethora of events to choose between.  There is a similar almost infinite set of things that can be _done_ to a user interface.  Each element has a wide range of possible mutations.  It is up to the developer to decide _what to do_ based on whatever event that happens.

In simple user interfaces, the event-action paradigm is fine.  Here, for example is an input handler that turns the text green when text is entered into the field:

```css
.green {
    box-shadow: 0 0 30px green
}
```

```html
<input id="my_editor">
```

```js
var field = document.getElementById("my_editor");
function handleChange(e) {
  field.classList.add("green")
}
field.onchange = handleChange
```

Don't cringe, it's a simple component that turns green (an action) whenever a particular event happens (the field is modified).  This is the component's **behaviour**.

However, in order for this code to support _anything_ other than turning it green when it's modified, it will need conditional logic.  If the field should only turn green if it has any text, then the event handler needs an _if_ test, _and_ it needs to check the "current state" of the component.  This is the beginning of the complexity creep.

```js
function handleChange(e) {
  if (field.value != "") {
    field.classList.add("green")
  }
}
```

## Statecharts

As mentioned earlier, when implementing statecharts, the events are passed on to the statechart instead of being acted upon directly. The statechart then determines what to do.

The simplest state machine (a simple form of a statechart) is shown below. It has the same behaviour as the example above:

```js
var currentState = "not_green";
var stateMachine = {
  "not_green": () => field.classList.add("green")
}
function handleChange(e) {
  stateMachine[currentState]()
}
```

Now this state machine is extremely simple, it only has one state and knows only one way to behave.  But it is now a lot easier to make this component do more.

```js
var stateMachine = {
  "not_green": () => { field.classList.add("green"); currentState = "green"; },
  "green": () => { field.classList.remove("green"); currentState = "not_green"; }
}
```

By changing the state machine alone, we can now change the behaviour of the component.  It now alternates between having the "green" class every time the field changes.

We can introduce a _guard_ in order to prevent the event from having an effect.  Let's extend it so that the field is green only when text has been added to it:


```js
var stateMachine = {
  "not_green": () => {
    if (field.value == "") return;
    currentState = "green";
    field.classList.add("green");
  },
  "green": () => {
    if (field.value != "") return;
    currentState = "not_green";
    field.classList.remove("green");
  }
}
```

<p data-height="228" data-theme-id="0" data-slug-hash="YYLaGM" data-default-tab="js,result" data-user="mogsie" data-embed-version="2" data-pen-title="Green input box" class="codepen">See the Pen <a href="https://codepen.io/mogsie/pen/YYLaGM/">Green input box</a> by Erik Mogensen (<a href="https://codepen.io/mogsie">@mogsie</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

This is a crude approximation of a state machine, but it _is_ a state machine, and has a lot of the moving parts of a statechart too:

* It accepts events, although it simply treats all events equal. Real statecharts have named events.
* It has several states, `green` and `not_green`
* It has an "active" state (`currentState`)
* It reacts differently depending on which "active state" state it's in
* It also reacts differently depending on "real world" information (`if (field.value == "") return;`)
* It changes the "current" state when it deals with an event
* It has side effects (known as actions, it adds and removes the `green` class)

It has a few limitations too, though

* It is only a glorified enumeration with side effects.
* It's just _two states_
* It only handles _one event_
* It's extremely tightly coupled to the rest of the system (it talks directly to the DOM)
* It's difficult to extend with substates

While it is possible to "roll your own" state machine, it is likely not worth the effort.  There are numerous edge cases that you need to consider, and if you're not careful, such a one-off state machine becomes more difficult to maintain than the original spaghetti code it was meant to displace.  It is a bit like rolling your own date handling code; it works for the simplest of cases, but is quickly outgrown.

The code shown above was introduced solely to describe how a state machine fits in, in the context of user interfaces.  In order to show more advanced examples, it's necessary to avoid coding the inner workings of the state machine, and try to focus on the important parts, namely the different states, and which events causes the states to change.

In order to help, we'll be introducing a statechart library

## Introducing XState

XState is a javascript library that essentially allows us to hide the inner workings of the state machine.  You provide it with an object that _describes_ the state machine you're interested in, and XState returns a state machine that provides _pure functions_ that you can use to answer the question: "If I'm in _this_ state, and _this_ happens, _what_ should I do?"

To give you a quick primer, we'll rewrite the green / not green state machine above using XState.

First of all, we'll need a state machine, constructed by XState.

```js
import { Machine } from 'xstate';
const stateMachine = Machine({
  id: "example",
  initial: "not_green",
  states: {
    "not_green": {
      on: {
        "change": "green"
      }
    },
    "green": {
      on: {
        "change": "not_green"
      }
    }
  }
}
```

One thing to note is that in state machines, and statecharts, events are given explicit names.  For our simple example I called the event `change`.

Now, this `stateMachine` variable provides a _pure functional_ interface to the state machine.  This means that this state machine cannot and will not have side effects.  Every time you use it, you tell it what the "current" state is, the event (what "happens"), and _it_ tells you what happened.

We start off our state machine by asking the state machine what the "initial" state is:

```js
var currentState = stateMachine.initialState;
```

`currentState` is an XState _State_ instance, which has a _value_ which initially should be `"not_green"`.  It represents _our_ state.

You can then simulate what happens if you pass it the `change` event:

```js
currentState = statemachine.transition(currentState, "change");
```

`currentState` will now describe the `green` state, and if you did it again, it would be the `not_green` state once again.  What we have might seem like a pretty advanced boolean, but don't despair.  It's time to hook this state machine up to our user interface.  To start with, we'll let any change in the text field will trigger the "change" event.

The first thing we need to do when handling the event is to trigger a state change, as shown above.  The next thing is then to check which state we're now in, and respond accordingly.

```js
if (currentState.value == "green") {
  field.classList.add("green");
}
if (currentState.value == "not_green") {
  field.classList.remove("green");
}
```

<p data-height="265" data-theme-id="0" data-slug-hash="Rxvowv" data-default-tab="js,result" data-user="mogsie" data-embed-version="2" data-pen-title="Green input box (xstate version 1)" class="codepen">See the Pen <a href="https://codepen.io/mogsie/pen/Rxvowv/">Green input box (XState version 1)</a> by Erik Mogensen (<a href="https://codepen.io/mogsie">@mogsie</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

### Guards

This initial implementation switches between the `green` and `not_green` states **every time** a change happens. We wanted to switch the state depending on the value of the text field. Let's do that.

If you're not used to thinking in state machines, it is usual to try to solve this _outside_ the state machine, by perhaps checking the value _before_ telling the state machine about the event. However state machines have support for something called _guards_ which allow the state machine to make the decision. Allowing this to be dealt with _inside_ the state machine ends up being more flexible.

First of all, we need to gather information about the world that we want the state machine to be able to inspect, a form of "extended state". For our example we want the state machine's behaviour to depend on the input value, or more specifically, the length of the value (or something else that constitutes validity). This _extra data_ is passed as the third parameter to `transition`:

```js
currentState = stateMachine.transition(currentState, 'change', field.value);
```

For simplicity, we're just passing the value of the field as the extended state, we could pass in the length or, even better, an object literal with room for more variables.

In the state machine definition, we now change the `on: { change: ... }` handlers so that they _check the guard_ before continuing. When we're in the `not_green` state we will only go to `green` if the `length` is greater than 0:

```js
on: {
  change: {
    target: "green",
    cond: text => text.length > 0;
  }
}
```

Here `cond` is short for _condition_. The condition must hold (evaluate to `true`) for the transition to happen. Conversely, we'll check that when we're in the `green` state we'll only transition to the other state if length is equal to 0.

<p data-height="265" data-theme-id="0" data-slug-hash="JMxEKg" data-default-tab="js,result" data-user="mogsie" data-embed-version="2" data-pen-title="Green input box (xstate version 2, with guards)" class="codepen">See the Pen <a href="https://codepen.io/mogsie/pen/JMxEKg/">Green input box (XState version 2, with guards)</a> by Erik Mogensen (<a href="https://codepen.io/mogsie">@mogsie</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

> TKTK update the code samples from the pen:

## Actions based on the "current state"

The state machine as it stands is useful in its own right: the behaviour is isolated in the statechart definition, and we can make _some_ changes. However, code outside the state machine is completely dependent on the names of the states, so introducing a new state would require us to change the code that talks with the state machine.

There's one last thing that we ought to do, and that's implement actual side effects of a state machine.

When you have a state machine or statechart that "drives" your UI, it is quite common for the states in the statechart to (at least at the highest level) correspond to "modes" of the user interface.  In our sample we have "green" and "not_green" as states, and we have an ugly _if_ test which checks _which_ state we're in, and performs some actions based on it (adds/removes a class).

An easy simplification of this is to set the `class` of the element to the value of the state and be done with it. This is a common way of using the "current state" to effect changes to the user interface. That ugly set of if-tests can be reduced to a simple assignment:

```js
field.classList.value = currentState.value;
```

The field now gets the class based on the current state of the state machine. If we introduce a new state in the state machine, it automatically becomes a class of the field, for better or worse.

This has some nice benefits:

* If we introduce a new state, we don't need to write any code to deal with that new state.
* If we introduce a new state, we can easily introduce a new CSS class that describes what that state should look like.

### "Actual" side effects

There are some side effects that cannot be done based on the class alone, such as making a HTTP request.  Such long running things are in statechart terminology called "activities", and activities are started and stopped by way of _actions_.  Let's make an activity that represents a HTTP request.  That activity is _started_ and _stopped_ by way of two functions we'll define: `startHttpRequest` and `cancelHttpRequest`.

To avoid having to talk to a real server, we're just going to use `setTimeout` to simulate a long running request:

```js
var timeout = undefined;

startHttpRequest() {
  timeout = setTimeout(function() {
    timeout = undefined;
    resultsArrived({fake: "data"});
  }, 2000);
}

cancelHttpRequest() {
  if (timeout != undefined) {
    clearTimeout(timeout);
    timeout = undefined;
  }
}

function resultsArrived(data) {
  // interesting stuff happens here
}
```
> TKTK update from pens

When `startHttpRequest` is called, it will call `resultsArrived` after 2 seconds, unless `cancelHttpRequest` is called first.  It has an unfortunate, but deliberate behaviour that if you call the startHttpRequest many times, it will actually call resultsArrived many times.

### Making use of our "HTTP client"

The point of this exercise is to show how _side effects_ are handled in the state machine.  As mentioned earlier, the HTTP request is called an _activity_ and it is often the case that an activity is tied directly to _being in a state_.  But instead of having an `if` test to check if we're in a particular state, such side effects are often better to make explicit in the state machine.  This is done by defining _actions_.

An action can happen as a consequence of _entering_ or _exiting_ any state.  So if we want this HTTP request activity to happen in a particular state, we just specify entry and exit handlers to _start_ and _stop_ the activity in question:

```js
green: {
  onEntry: "startHttpRequest",
  onExit: "cancelHttpRequest",
  ...
}
```

This declares that the `startHttpReqest` side effect should happen when the _green_ state is entered, and that `cancelHttpRequest` should happen when it is exited.

XState then provides these actions as a string array in our `currentState`.  If we happen to enter the green state, `currentState.actions` will be `[ "startHttpRequest" ]`.  We can harness this by calling the corresponding function:

```js
// TKTK should be handleEvent or something.
function transition(event, data) {
  currentState = stateMachine.transition(currentState, event, data);
  field.classList.value = currentState.value;
  currentState.actions.forEach(item => window[item]());
}
```

Forgive the carelessness of polluting the global scope, this is only to keep it as simple as possible.

The line `currentState.actions.forEach(item => window[item]())` will take any string in the `currentState.actions` array and assume that it's a global function, and simply call it.

The result is now that whenever we enter the green state, the `startHttpRequest` is called, and when we exit the green state, it calls the `cancelHttpRequest`.

### Handling the results

We now have a situation where the HTTP request fires, and then two seconds later, we get some results.  The `resultsArrived` function is called with some data.  

In a non-statechart driven system, this `resultsArrived` function would typically immediately update the DOM and go about its business.  However, in a statechart driven system, we get the function to only _tell the state machine_ about the fact that some data arrived.  The state machine would then decide what to do.  This is a _different_ event than typing text into a field, so we'll give it a new name.  We'll call this the `results` event.

```js
var results;
function resultsArrived(data) {
  results = data;
  currentState = stateMachine.transition(currentState, "results");
  field.classList.value = currentState.value;
  currentState.actions.forEach(item => window[item]());
}
```

We now already have some code duplication in that we have two places where the field.classList is updated, so it's probably about time to extract this into its own function, a "stateful" wrapper around the XState state machine:

```js
var currentState;
function transition(event, data) {
  currentState = stateMachine.transition(currentState, event, data);
  field.classList.value = currentState.value;
  currentState.actions.forEach(item => window[item]());
}
```

Now when results arrive, and the change event happens, we can instead call the `transition` function to deal with the state machine:

```
function handleChange(e) {
  transition("change", field.value);
}

function resultsArrived(data) {
  results = data;
  transition("results");
}
```

Note that the state machine hasn't declared what should happen when the `results` event happens, so let's add that to the definition too:

``` js
on: {
   results: "not_green",
   change: ...
```

This tiny change _handles_ the `results` event by telling the machine to go to the `not_green` state.  With our fake HTTP request, you can see that the machine leaves the "green" state after 2 seconds.

<p data-height="265" data-theme-id="0" data-slug-hash="EorWVP" data-default-tab="js,result" data-user="mogsie" data-embed-version="2" data-pen-title="Green input box (XState version 4, actual side effects)" class="codepen">See the Pen <a href="https://codepen.io/mogsie/pen/EorWVP/">Green input box (xstate version 4, actual side effects)</a> by Erik Mogensen (<a href="https://codepen.io/mogsie">@mogsie</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

## Building blocks

We now have a lot of the building blocks in order to make efficient use of statecharts. We have a machine which:

* Accepts events, and "guard" data
* Tells us what activities to start and stop
* Tells us "what state" it's in

But harnessing these building blocks is for another page, but to start you off with some exercises, you can try a few things:

* Introduce a new state ("red") and when you get results back from the "server", transition to it instead.  Add some CSS for it too.
* Add a guard condition that checks the data coming back from the server, and go to the red or not_green states accordingly
* Go from the red state to the green/not_green states accordingly.












TKTK stuff below this line can be ignored, I think it's food for a separate article.



* Actions should be used for side effects
* User interface changes could be deemed a side effect, so _can_ be controlled via actions
* The "current state" can be thought of as an implicit side effect
* It's possible to take the "current state" and control user interface changes based on it

Especially in declarative UI frameworks like HTML or React, it makes a lot of sense to model the statechart based on different "modes" of the UI, and use normal statechart mechanisms to control which is the "current state".  It therefore makes a lot of sense to re-use the "current state" and pass this knowledge on to the declarative UI, basically asking the UI to render the "current state" UI.

This has the benefit of keeping the statechart very much in line with the major modes of the UI.  When a component gets a new "mode of operation", it also gets a new "top level state".  This makes it easier when showing e.g. a statechart to non-developers, like QA or designers, since they will quickly recognise the states and be able to relate to them.

TKTK not finished yet.
