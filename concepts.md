# Concepts
```html
<style>
svg {
}
body>ul {
  margin-top: 15em;
}
ul>li {
}
ul>li>span {
  display: block;
  color: blue;
  text-decoration: underline;
  cursor: pointer;
  line-height: 1.5em;
  padding: 0.3em;
}
ellipse {
  fill: rgba(0,0,0,0.3);
}
text {
    fill: rgba(0,0,0,0.3);
    font-family: sans-serif;
    white-space: pre;
  }
  text.concept-entry,
  text.concept-exit,
  text.concept-action {
    font-size: 16px;
  }
  g.concept-delayed-event text,
  text.concept-event {
    font-size: 16px;
  }
  path {
    stroke: rgba(0,0,0,0.3);
  }
g.concept-transition>path {
      fill: rgba(0,0,0,0.3);
}
  g.concept-state>text {
    font-size: 24px;
    stroke-width: 3px; 
    white-space: pre;
  }
  g.concept-state>text.concept-action {
    font-size: 16px;
  }
  g.concept-state>path {
    stroke-width: 3;
  }

  g.concept-state>rect {
    fill: none;
    stroke: rgba(0,0,0,0.3);
    stroke-width: 3;
  }

  svg.concept-initial-transition g.concept-initial-transition>path,
  svg.concept-self-transition g.concept-self-transition>path,
  svg.concept-delayed-transition g.concept-delayed-transition>path,
  svg.concept-transition g.concept-transition>path,
  svg.concept-simple-state g.concept-simple-state>rect,
  svg.concept-simple-state g.concept-simple-state>path,
  svg.concept-compound-state g.concept-compound-state>rect,
  svg.concept-compound-state g.concept-compound-state>path,
  svg.concept-state g.concept-state>rect,
  svg.concept-state g.concept-state>path {
    stroke: #C00;
  }

  svg.concept-initial-transition g.concept-initial-transition>ellipse,
  svg.concept-initial-transition g.concept-initial-transition>path,
  svg.concept-self-transition g.concept-self-transition>path,
  svg.concept-self-transition g.concept-self-transition>text,
  svg.concept-transition g.concept-transition>path,
  svg.concept-transition g.concept-transition>ellipse,
  svg.concept-delayed-transition g.concept-delayed-transition>path,
  svg.concept-delayed-transition g.concept-delayed-transition>text,
  svg.concept-action text.concept-action,
  svg.concept-entry text.concept-entry,
  svg.concept-exit text.concept-exit,
  svg.concept-event text.concept-event,
  svg.concept-simple-state g.concept-simple-state>text,
  svg.concept-compound-state g.concept-compound-state>text,
  svg.concept-state g.concept-state>text {
    fill: #C00;
  }
  </style>

<script>
var highligted = null
function highlight(what) {
  svg = document.getElementById("svg");
  if (svg.classList.contains(what)) {
    svg.classList = "";
  }
  else {
    svg.classList = what;
  }
}
</script>


{% include concepts.svg %}

<!-- TODO render as horizontal menu -->
<ul>
<li><span onclick="highlight('concept-state')">State</span>
<ul>
<li><span onclick="highlight('concept-compound-state')">Compound state</span></li>
<li><span onclick="highlight('concept-simple-state')">Simple (Atomic) states</span></li>
</ul>
</li>
<li><span onclick="highlight('concept-transition')"> Transition</span>
<ul>
<li><span onclick="highlight('concept-event')"> Event</span></li>
<li><span onclick="highlight('concept-initial-transition')"> Initial transition</span></li>
<li><span onclick="highlight('concept-self-transition')"> Self transition</span></li>
<li><span onclick="highlight('concept-delayed-transition')">Delayed Transition</span></li>
</ul>
</li>
<li><span onclick="highlight('concept-action')">Actions</span>
<ul>
<li><span onclick="highlight('concept-entry')">Entry actions</span></li>
<li><span onclick="highlight('concept-exit')">Exit actions</span></li>
</ul>
</li>
</ul>
```
