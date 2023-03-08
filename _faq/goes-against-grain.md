---
title: Statecharts go against the grain of my tech stack.  Why should I use them?
---

# Statecharts go against the grain of my tech stack.  Why should I use them?

Statecharts themselves are native only to a few tech stacks out there, and even in them, they are often an optional add-on.  Rarely do statecharts permeate the tech stack in use, and sometimes the "way things are done" in a particular stack causes confusion and make it hard to know when and why to use statecharts.

Statecharts thrive in any system that is _event driven_.  Statecharts were _designed_ back in 1987, specifically mentioning _events_ and _actions_.  So if this tech stack of yours _handles events_ and _performs actions_ based on those events, then _probably_ there is some conditional logic in the event handling itself.

In many of these tech stacks, it is left up to the developer to figure out the best way to structure their action code, such as making HTTP requests, and perhaps set boolean flags for deciding which UI to show at any given time; and essentially "what to do" given an event.

## TODOMVC examples

Here are some of the places in the source code of todomvc in various languages.

### Backbone.js

In the view of the backbone todomvc app, there are lots of event handlers that on their own is relatively simple, but they are chained together in odd ways.  Let's look, for example, at [the `close` function](https://github.com/tastejs/todomvc/blob/gh-pages/examples/backbone/js/views/todo-view.js#L79-L99):

```js
// Close the `"editing"` mode, saving changes to the todo.
close: function () {
	var value = this.$input.val();
	var trimmedValue = value.trim();

	// We don't want to handle blur events from an item that is no
	// longer being edited. Relying on the CSS class here has the
	// benefit of us not having to maintain state in the DOM and the
	// JavaScript logic.
	if (!this.$el.hasClass('editing')) {
		return;
	}

	if (trimmedValue) {
		this.model.save({ title: trimmedValue });
	} else {
		this.clear();
	}

	this.$el.removeClass('editing');
}
```

It starts by extracting some data from the application, but more importantly, it looks at the UI to see if an element has the `editing` class, and then decides to ignore the event if it doesn't.  This prevents "close()" from having any action unless the entry already is "in editing mode".  Then it does another if-test to check if it's supposed to _clear_ or _save_ the to-do list entry, depending if there is any value in the `trimmedValue`.

These two if-tests are exactly the type of complexity that starts to creep into the code, which eventually leads to unmaintainable code.

If you don't see this as a problem, consider how you might extend the code to show an "are you sure" dialog (not an alert, just an overlay) when trying to close a todo that isn't saved.  Then consider how it would look if you only wanted to provide this "are you sure" dialog if the user had made a change to the todo at all.  These are examples of ways that logic like the above falls apart, and statecharts really shine, and taking a little effort in discovering these hidden lumps of spaghetti code is worth it.

#### Statechart

To start off with the todo entry modeled as a statechart would probably have different states for dirty and clean, which would be kept up-to-date as the user modifies text.  The <kbd>enter</kbd> key would trigger the _saving_ state, but the <kbd>Esc</kbd> event would trigger an "escape" event.  The clean state would handle the "escape" event by way of a transition to a "closed" state, nothing to do here.  The dirty state would handle the "escape" event by transitioning to e.g. an _are you sure_ state.  The _are you sure_ state would then have transitions for the "ok" and "cancel" responses; cancel going back to dirty, and OK would transition to a "saving" state.  The "saving" state would actually trigger saving.  In the "saving" state, it can pass or fail (or timeout...) and any events that happen _while saving_ can be dealt with accordingly, e.g. back to the "dirty" state.

### AngularJS

Let's look at the code that handles saving at the AngularJS todomvc example:

```js
$scope.saveEdits = function (todo, event) {
	// Blur events are automatically triggered after the form submit event.
	// This does some unfortunate logic handling to prevent saving twice.
	if (event === 'blur' && $scope.saveEvent === 'submit') {
		$scope.saveEvent = null;
		return;
	}

	$scope.saveEvent = event;

	if ($scope.reverted) {
		// Todo edits were reverted-- don't save.
		$scope.reverted = null;
		return;
	}

	todo.title = todo.title.trim();

	if (todo.title === $scope.originalTodo.title) {
		$scope.editedTodo = null;
		return;
	}

	store[todo.title ? 'put' : 'delete'](todo)
		.then(function success() {}, function error() {
			todo.title = $scope.originalTodo.title;
		})
		.finally(function () {
			$scope.editedTodo = null;
		});
};
```

This code is invoked directly from the view, as `ng-submit="saveEdits(todo, 'submit')` _and_ `ng-blur="saveEdits(todo, 'blur')"`. This means that the saveEdits happens to be called _twice_ when a form is submitted, because the input is blurred on submit.  This itself is the point of the first if-test to avoid double-saving.  Then, the `$scope` is inspected to check for various conditions, such as reverting, and if the todo was modified, and so on.  Finally, it decides if it should save or delete the todo depending on if the title is filled out.  A (short) promise chain concludes the code to store (or delete) the todo-entry.

Here again, it's quite easy to dream up ways that this code becomes a lot more dense.  What happens, for example if saving the todo fails?  If the promise chain for saving takes a long time, and the user clicks save again, the app would be in two save operations at the same time.  These are just some of the examples where an explicit statechart would help keep the code clear, even clearer than it is today.
