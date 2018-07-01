# Concepts

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


<svg id="svg" viewBox="-111 -43 858 549" width="100%" xmlns="http://www.w3.org/2000/svg" xmlns:bx="https://boxy-svg.com">
  <g transform="matrix(1, 0, 0, 1, 0, 0)">
    <g class="concept-state concept-compound-state">
      <rect x="-88.152" y="-10.866" width="262.559" height="148.015" class="state" rx="15.659" ry="15.659"></rect>
      <path class="state" d="M -87.235 21.511 L 173.872 21.511"></path>
      <text x="15.955" y="14.711" class="state">Off</text>
    </g>
    <g id="state-A" class="concept-state concept-simple-state" transform="matrix(1, 0, 0, 1, -2, 10)">
      <rect x="-14.856" y="46.198" width="56.462" height="59.889" class="state" rx="15.659" ry="15.659"></rect>
      <text x="8.117" y="83.687" style="font-family: sans-serif; font-size: 16px; white-space: pre;">A</text>
    </g>
    <g id="state-B" class="concept-state concept-simple-state" transform="matrix(1, 0, 0, 1, -2, 10)">
      <rect x="102.478" y="59.132" width="56.462" height="59.889" class="state" rx="15.659" ry="15.659"></rect>
      <text x="125.183" y="93.983" style="font-family: sans-serif; font-size: 16px; white-space: pre;">B</text>
    </g>
    <g id="transition-A-A-flick" class="concept-transition concept-self-transition" transform="matrix(1, 0, 0, 1, -2, 10)">
      <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.999043, 0.043751, -0.043751, 0.999043, -75.254522, 30.734625)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
      <text class="concept-event" x="-66.43" y="46.318" style="font-family: sans-serif; font-size: 16px; white-space: pre;">flick</text>
      <path d="M 461.164 554.224 A 63.697 63.697 0 1 1 383.028 484.088 L 383.263 485.06 A 62.697 62.697 0 1 0 460.172 554.095 Z" style="fill: none; stroke-width: 4.35656;" transform="matrix(0.382873, 0.253299, -0.253299, 0.382873, -48.968494, -229.270981)" bx:shape="pie 398 546 62.697 63.697 97.418 346.405 1@eb644306"></path>
    </g>
    <g id="transition-A-B-timeout" class="concept-transition concept-delayed-transition" transform="matrix(1, 0, 0, 1, -2, 10)">
      <text x="50.45" y="50.987" style="font-family: sans-serif; font-size: 16px; white-space: pre;">after 2 s</text>
      <path style="fill: none; stroke-width: 2;" d="M 41.869 67.712 C 41.869 67.712 48.971 54.864 64.596 54.485 C 80.221 54.106 92.077 62.89 92.077 62.89"></path>
      <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.999043, 0.043751, -0.043751, 0.999043, 42.678887, 40.822474)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
    </g>
    <g class="concept-transition concept-initial-transition" transform="matrix(1, 0, 0, 1, -83.733116, -22.002293)">
      <ellipse style="" transform="matrix(0.6, 0.8, -0.8, 0.6, 66.684728, -8.839179)" cx="51.177" cy="44.699" rx="7.288" ry="7.288"></ellipse>
      <path style="fill: none; stroke-width: 2;" d="M 67.134 54.917 C 67.134 54.917 72.585 50.566 82.249 54.161 C 91.913 57.756 92.4 65.968 92.4 65.968"></path>
      <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.646251, 0.763125, -0.763125, 0.64625, 75.1945, 14.086562)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
    </g>
  </g>
  <g transform="matrix(1, 0, 0, 1, 189.96713256835935, 57.20753860473633)" class="concept-state concept-compound-state">
    <rect x="70.115" y="63.175" width="470.373" height="368.829" class="state" rx="15.659" ry="15.659"></rect>
    <path style="stroke-width: 3;" d="M 69.114 92.333 L 538.599 92.333"></path>
    <text x="301.192" y="85.533" style="font-size: 24px; stroke-width: 3px; white-space: pre;">On</text>
    <g transform="matrix(1, 0, 0, 1, 113.589722, 86.11718)" style="" class="concept-state concept-simple-state">
      <rect x="-14.856" y="46.198" width="56.462" height="59.889" class="state" rx="15.659" ry="15.659"></rect>
      <text x="8.117" y="83.687" style="font-family: sans-serif; font-size: 16px; white-space: pre;">C</text>
    </g>
    <g transform="matrix(1, 0, 0, 1, 212.147041, 87.333473)" class="concept-state concept-compound-state">
      <rect x="0" y="59.132" width="280.677" height="275.145" class="state" rx="15.659" ry="15.659"></rect>
      <text x="90.183" y="84.983" style="font-family: sans-serif; font-size: 16px; white-space: pre;">D</text>
      <path style="stroke-width: 3;" d="M 1 98.587 L 281.579 98.587"></path>
      <g class="concept-action" transform="matrix(1, 0, 0, 1, 10, 55)">
        <text class="concept-action concept-entry" x="0" y="282.095" transform="matrix(1, 0, 0, 1, 0, -211.823074)">entry / turn light on</text>
        <text class="concept-action concept-exit" x="0" y="304.213" transform="matrix(1, 0, 0, 1, 0, -211.823074)">exit / turn light off</text>
      </g>
      <g class="concept-transition concept-initial-transition" transform="matrix(1, 0, 0, 1, -50, 104.368713)" style="">
        <ellipse style="" transform="matrix(0.6, 0.8, -0.8, 0.6, 66.684728, -8.839179)" cx="51.177" cy="44.699" rx="7.288" ry="7.288"></ellipse>
        <path style="fill: none; stroke-width: 2;" d="M 67.134 54.917 C 67.134 54.917 72.585 50.566 82.249 54.161 C 91.913 57.756 92.4 65.968 92.4 65.968"></path>
        <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.646251, 0.763125, -0.763125, 0.64625, 75.1945, 14.086562)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
      </g><g transform="matrix(1, 0, 0, 1, 37.043976, 136.335999)" class="concept-state concept-compound-state">
        <rect x="-14.856" y="46.198" width="145.796" height="113.514" class="state" rx="15.659" ry="15.659"></rect>
        <text x="45.795" y="68.201" style="font-family: sans-serif; font-size: 16px; white-space: pre;">E</text>
        <g transform="matrix(1, 0, 0, 1, 69.648926, 38.037197)" class="concept-state concept-simple-state">
          <rect x="-14.856" y="46.198" width="56.462" height="59.889" class="state" rx="15.659" ry="15.659"></rect>
          <text x="8.117" y="83.687" style="font-family: sans-serif; font-size: 16px; stroke-width: 2.51788px; white-space: pre;">G</text>
        </g>
        <g class="concept-transition concept-self-transition" transform="matrix(1, 0, 0, 1, 69.612343, 42.377678)">
          <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.999043, 0.043751, -0.043751, 0.999043, -75.254522, 30.734625)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
          <text class="concept-event" x="-66.43" y="46.318">flick</text>
          <path d="M 461.164 554.224 A 63.697 63.697 0 1 1 383.028 484.088 L 383.263 485.06 A 62.697 62.697 0 1 0 460.172 554.095 Z" style="fill: none; stroke-width: 4.35656;" transform="matrix(0.382873, 0.253299, -0.253299, 0.382873, -48.968494, -229.270981)" bx:shape="pie 398 546 62.697 63.697 97.418 346.405 1@eb644306"></path>
        </g>
      </g><g transform="matrix(1, 0, 0, 1, 210.942169, 177.960098)" class="concept-state concept-simple-state">
        <rect x="-14.856" y="46.198" width="56.462" height="59.889" class="state" rx="15.659" ry="15.659"></rect>
        <text x="8.117" y="83.687" style="font-family: sans-serif; font-size: 16px; stroke-width: 2.51788px; white-space: pre;">F</text>
      </g>
      <g transform="matrix(1, 0, 0, 1, 95.622757, 167.841202)" class="concept-transition concept-delayed-transition">
        <text x="96.45" y="6" style="">after 0.5 s</text>
        <path style="fill: none; stroke-width: 2;" d="M 71.687 39.154 C 71.687 39.154 92.319 7.004 115.539 14.037 C 138.759 21.07 139.277 42.529 139.277 42.529"></path>
        <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(-0.999584, 0.02884, -0.028843, -0.999584, 192.297647, 65.478925)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
      </g>
      
      
    </g>
    <g transform="matrix(1, 0, 0, 1, 113.589722, 86.11718)" class="concept-transition concept-delayed-transition">
      <text x="50.45" y="50.987" style="font-family: sans-serif; font-size: 16px; white-space: pre;">after 0.5 s</text>
      <path style="fill: none; stroke-width: 2;" d="M 41.869 67.712 C 41.869 67.712 48.971 54.864 64.596 54.485 C 80.221 54.106 92.077 62.89 92.077 62.89"></path>
      <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.999043, 0.043751, -0.043751, 0.999043, 42.678887, 40.822474)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
    </g>
    <g class="concept-transition concept-initial-transition" transform="matrix(1, 0, 0, 1, 31.8566, 54.114891)" style="">
      <ellipse style="" transform="matrix(0.6, 0.8, -0.8, 0.6, 66.684728, -8.839179)" cx="51.177" cy="44.699" rx="7.288" ry="7.288"></ellipse>
      <path style="fill: none; stroke-width: 2;" d="M 67.134 54.917 C 67.134 54.917 72.585 50.566 82.249 54.161 C 91.913 57.756 92.4 65.968 92.4 65.968"></path>
      <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.646251, 0.763125, -0.763125, 0.64625, 75.1945, 14.086562)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
    </g>
  </g>
  <g class="concept-transition" transform="matrix(1, 0, 0, 1, 0, -7.105427357601002e-15)">
    <path style="fill: none; stroke-width: 2; stroke-linejoin: round; stroke-linecap: round;" d="M 150.132 181.757 C 150.132 181.757 182.523 143.191 217.793 165.592 C 253.063 187.993 260.885 202.868 260.885 202.868" transform="matrix(-0.97679, -0.2142, 0.2142, -0.97679, 367.534245, 401.290093)"></path>
    <text class="concept-event" x="161.796" y="201.503" style="font-family: sans-serif; font-size: 16px; white-space: pre;">flick</text>
    <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(-0.663706, -0.747994, 0.747995, -0.663706, 175.069181, 200.382307)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
  </g>
  <g class="concept-transition" transform="matrix(1, 0, 0, 1, 0, -7.105427357601002e-15)">
    <path style="fill: none; stroke-width: 2; stroke-linejoin: round; stroke-linecap: round;" d="M 174.949 99.415 C 174.949 99.415 229.086 60.204 255.198 80.721 C 281.31 101.238 278.268 111.287 278.268 111.287"></path>
    <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.65779, 0.753202, -0.7532, 0.657792, 259.547486, 56.194117)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
    <text class="concept-event" x="224.003" y="70.158" style="font-family: sans-serif; font-size: 16px; white-space: pre;">flick</text>
  </g>
  <g class="concept-transition concept-initial-transition" transform="matrix(1, 0, 0, 1, -160.04922485351562, -89.05534362792969)">
    <ellipse style="" transform="matrix(0.6, 0.8, -0.8, 0.6, 66.684728, -8.839179)" cx="51.177" cy="44.699" rx="7.288" ry="7.288"></ellipse>
    <path style=" fill: none; stroke-width: 2;" d="M 67.134 54.917 C 67.134 54.917 72.585 50.566 82.249 54.161 C 91.913 57.756 92.4 65.968 92.4 65.968"></path>
    <path d="M 52.991 13.003 L 60.431 25.89 L 45.55 25.89 L 52.991 13.003 Z" style="" transform="matrix(0.646251, 0.763125, -0.763125, 0.64625, 75.1945, 14.086562)" bx:shape="triangle 45.55 13.003 14.881 12.887 0.5 0 1@5e4c3892"></path>
  </g>
</svg>

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
