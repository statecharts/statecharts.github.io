<?xml version="1.0"?>
<!--
Copyright (C) Escenic AS

This work is licensed under the Creative Commons
Attribution-NonCommercial 4.0 International
License. To view a copy of this license, visit
http://creativecommons.org/licenses/by-nc/4.0/.
-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:scxml="http://www.w3.org/2005/07/scxml"
  xmlns="http://www.w3.org/1999/xhtml"
  version="1.0"
>

  <xsl:output method="html"
              version="1.0"
              indent="yes" />

  <xsl:template match ="/">
    <xsl:apply-templates select="/*" mode="root"/>
  </xsl:template>

  <xsl:template match ="/scxml:scxml" mode="root">
    <html>
      <head>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
        <script type="text/javascript" src="https://rawgit.com/sporritt/jsPlumb/1.7.2/dist/js/jquery.jsPlumb-1.7.2.js"/>

        <title>State Chart XML</title>
        <style type="text/css">
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 1em;
}

h1 {
  font-size: 1.5em;
}

h2 {
  font-size: 1.2em;
  margin-top: 3em;
  margin-bottom: 0em;
}

h3,h4,h5,h6 {
  font-weight: bold;
  margin-top: 0em;
  margin-bottom: 0.2em;
}

h3,h4,h5 {
  font-size: 1em;
}

a {
  font-weight: bold;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}


a.plain {
  font-weight: inherit;
}

.clearfloat {
  clear: left;
}

p {
  margin-top: 0em;
  margin-bottom: 0.6em;
  padding-right: 4cm;
}

section {
  transition: background-color 0.4s;
}

.type-parallel {
  padding-bottom: 0;
}

.type-parallel > h2 {
  margin-bottom: 0 !important;
}

.type-parallel > .type-initial {
  display: none !important;
}

.type-parallel > .type-state {
  border: 1px dashed black;
  border: 1px dashed black;
  margin-left: -1px;
  margin-top: -1px;
  border-radius: 0;
  clear: left;
  width: 100%;
  margin-right: 0;
  margin-bottom: -1px;
  padding-top: 5mm;
}

.type-parallel > .type-state {
  vertical-align: top;
  display: inline-block !important;
}

.type-parallel > .type-state.collapsed {
  vertical-align: top;
  display: none !important;
}

.type-final,
.type-history,
.type-initial {
  display: inline-block !important;
  margin: 0 1cm 3mm;
  border: 20px solid black;
  border-radius: 30px;
  width: 14px;
  height: 14px;
  background-color: black;
}

.type-history {
  background-color: white;
  border-width: 0px;
  vertical-align: top;
}

.type-final *,
.type-initial * {
  display: none;
}

/*.type-history:before,*/
.type-history > .transition em,
.type-final:before {
  content: " ";
  display: block;
  position: absolute;
  border: 5px solid black;
  color: white; /* hide text... */
  padding: 30px;
  margin-left: -28px;
  margin-top: -27px;
  border-radius: 50px;
}
.type-history > .transition em:before {
  content: "H";
  font-size: 3em;
  position: absolute;
  margin-left: -0.3em;
  margin-top: -0.5em;
  color: black;
  font-style: normal;
}

.type-history > .transition em {
  width: 2mm;
  height: 2mm;
  overflow: hidden;
}

.type-history > .transition h3,
.type-history > h2 {
  display: none;
}


.collapsed > .type-initial {
  display: none !important;
}

.type-initial,
.type-final,
.type-history,
.type-state,
.type-parallel {
  float: left;
}

.type-state,
.type-parallel {
  display: block !important;
  border: 1px solid black;
  border-radius: 0.5cm;
  margin: 0.5cm 0.5cm 1.5cm;
  overflow: hidden;
}

.type-state {
  padding-bottom: 0.5cm;
}

.collapsed > .type-final,
.collapsed > .type-history,
.collapsed > .type-state,
.collapsed > .type-parallel {
  display: none !important;
}

.type-state > h2,
.type-parallel > h2 {
  margin: 0; padding: 0;
  text-align: center;
  border-bottom: 1px solid black;
  margin-bottom: 0.4cm;
  padding: 0.1cm 0.5cm;
}

/* Don't show headings of parallel states the same way */
.type-parallel > .type-state > h2 {
  float: right;
  padding: 0 2mm;
  margin: 0 2mm;
  border: none;
}

.popup:hover,
.popup {
  max-width: 5cm;
  display: none;
  background-color: white;
  border: 1px solid #ccc;
}

.entry:hover .popup,
.exit:hover .popup,
.line:hover .popup {
  display: block;
  position: absolute;
  padding: 1em;
  color: black;
}

.entry .line:before {
  content: "entry / ";
}

.exit .line:before {
  content: "exit / ";
}

.line .state {
  color: green;
}

.line .event {
  color: blue;
}

.line .guard {
  font-weight: bold;
}

.line.code {
  color: #555;
  font-family: monospace;
  white-space: pre;
}

.assignment {
  margin-left: 1cm;
  font-style: oblique;
}

.transition {
  padding: 1mm;
}

.transition h3 {
  font-weight: normal;
}


.hoverable {
  cursor: pointer;
}
.hoverable {
  color: blue;
  text-decoration: underline;
}

.highlight {
  background-color: #ccc;
}
.type-parallel.highlight {
  background-color: white;
}

.type-parallel.highlight > h2 {
  color: white;
  background-color: black;
  background-clip: border-box;
  border-radius: 4mm 4mm 0 0;
}

._jsPlumb_endpoint {
  display: block !important;
}

._jsPlumb_overlay:hover {
  transition:opacity 0.1s;
  opacity: 0.9;
}
._jsPlumb_overlay {
  opacity: 0.15;
  transition:opacity 0.4s;
  padding: 2mm;
  background-color: white;
  border-radius: 2mm;
  box-shadow: 0 0 125px black;
}

        </style>

        <script>

  function elementOf(a) {
    if (typeof(a) == "string") return document.getElementById(a);
    return a;
  }

  function where(a) {
    a = elementOf(a);
    return a.offsetTop + (a.offsetHeight / 2)
  }

  function distance(a, b) {
    return Math.abs(where(a) - where(b));
  }

  $(document).ready(function() {
    jsPlumb.Defaults.Endpoint = "Blank";
    jsPlumb.Defaults.PaintStyle.lineWidth = 4;
    jsPlumb.Defaults.PaintStyle.strokeStyle = "black";

    connection = undefined;

    $(".expandable>h2").bind('click',function() {
      if (connection) {
        var s = $(connection.source);
        var t = $(connection.target);
        $(this).parent().toggleClass("collapsed");
        if (s.is(':visible') &amp;&amp; t.is(':visible')) {
          console.log("both visible");
          jsPlumb.repaintEverything();
        }
        else {
          jsPlumb.detach(connection);
          connection = null;
        }
      }
    }).css("cursor","hand");
    $(".hoverable").bind('click',function() {
      var source = this;
      var sourceid = undefined;
      for (var i = 0; i &lt; 5; i++) {
        sourceid = source.id;
        source = source.parentElement;
        if (sourceid != undefined) break;
      }
      $("*").removeClass("highlight");
      if (connection) {
        jsPlumb.detach(connection);
        connection = null;
      }
      var target = $(document.getElementById(this.dataset.target));
      if (target.length == 0) return;
      while (target.is(':visible') == false) {
        target = target.parent();
      }
      target.toggleClass("highlight");
      var dist = distance(sourceid || source, target);
      var overlays =
           [ [ "Arrow", { location : 1 } ]
           ];
      if (this.dataset.event) {
        overlays.push([ "Label", { location : 30, "label": this.dataset.event + (this.dataset.guard ? ( " [" + this.dataset.guard +  "]" ) : "") } ]);
      }
      jsPlumb.recalculateOffsets(sourceid||source);
      jsPlumb.recalculateOffsets(target);
      connection = jsPlumb.connect(
        { source: sourceid || source
        , target: target
        , connector: [ "StateMachine", { margin: 0, curviness: dist > 300 ? 90 : 40, proximityLimit:50} ]
        , anchors:
          [ this.dataset.anchor || [ "Perimeter", { shape:"Square" }]
          , [ "Perimeter", { shape:"Square" } ]
          ]
        , overlays: overlays
           
      });
    });
  });
        </script>
      </head>
      <body>
        <h1>State Chart</h1>
        <p>A limited amount of interactivity is supported; superstates may be expanded, and transition links can (when clicked) show where the target state is.</p>
        <xsl:apply-templates select="*" mode="chart"/>
      </body>
    </html>
  </xsl:template>


  <xsl:template match ="scxml:state|scxml:parallel|scxml:final|scxml:history" mode="chart">
    <section id="{@id}">
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="scxml:state|scxml:parallel">
            <xsl:if test="not(parent::scxml:parallel)">
              <xsl:text>expandable </xsl:text>
              <!--<xsl:text>collapsed </xsl:text>-->
            </xsl:if>
            <xsl:text>type-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>type-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text> number-of-children-</xsl:text>
        <xsl:value-of select="count(scxml:state|scxml:parallel)"/>
      </xsl:attribute>
      <h2><xsl:value-of select="@id"/></h2>
      <xsl:if test="@initial">
        <section class="type-initial hoverable" id="{@id}-INITIALSTATE" data-target="{@initial}" data-anchor="Center">
          
        </section>
      </xsl:if>
      <!-- Make an "initial" state in case there are children -->
      <xsl:if test="scxml:state and not(@initial) and not(scxml:initial)">
        <section class="type-initial hoverable" id="{@id}-INITIALSTATE" data-target="{*[name() = 'state' or name() = 'parallel'][1]/@id}" data-anchor="Center">
          
        </section>
      </xsl:if>
      <xsl:apply-templates select="*" mode="chart"/>
    </section>
  </xsl:template>

  <xsl:template match="scxml:initial" mode="chart">
    <section class="type-initial hoverable" id="{../@id}-INITIALSTATE" data-target="{scxml:transition[1]/@target}" data-anchor="Center">
          
    </section>
  </xsl:template>

  <xsl:template match ="scxml:datamodel" mode="chart">
    <section class="datamodel">
      <h2>Data Model</h2>
      <ul>
        <xsl:apply-templates select="*" mode="chart"/>
      </ul>
    </section>
  </xsl:template>

  <xsl:template match ="scxml:data" mode="chart">
    <li class="data">
      <xsl:value-of select="@id"/>
    </li>
  </xsl:template>

  <xsl:template match ="scxml:onentry" mode="chart">
    <div class="entry">
      <span>entry / ...</span>
      <div class="popup">
        <xsl:apply-templates select="*" mode="chart"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:onexit" mode="chart">
    <div class="exit">
      <span>exit / ...</span>
      <div class="popup">
        <xsl:apply-templates select="*" mode="chart"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:transition" mode="chart">
    <span class="transition hoverable" data-target="{@target}" data-event="{@event}" data-guard="{@cond}">
      <span class="line">
        <xsl:if test="@event">
          <xsl:value-of select="@event"/>
        </xsl:if>
        <xsl:if test="not(@event)">
          <em><xsl:text>automatically</xsl:text></em>
        </xsl:if>
        <div class="popup">
        <xsl:if test="@event">
          <xsl:text>on the </xsl:text>
          <span class="event">
            <xsl:value-of select="@event"/>
          </span>
          <xsl:text> event</xsl:text>
        </xsl:if>
        <xsl:if test="not(@event)">
          <xsl:text>automatically</xsl:text>
        </xsl:if>
        <xsl:if test="@cond">
          <xsl:text> [only if </xsl:text>
          <span class="guard">
            <xsl:value-of select="@cond"/>
          </span>
          <xsl:text>],</xsl:text>
        </xsl:if>
        <xsl:text> transition to the </xsl:text>
        <span class="state">
          <xsl:value-of select="@target"/>
        </span>
        <xsl:text> state.</xsl:text>
        <xsl:apply-templates select="*" mode="chart"/>
        </div>
      </span>
    </span>
  </xsl:template>

  <xsl:template match ="scxml:assign" mode="chart">
    <div class="assignment">
      <xsl:if test="@location">
        <xsl:value-of select="@location"/>
      </xsl:if>
      <xsl:if test="@dataid">
        <xsl:value-of select="@dataid"/>
      </xsl:if>
      <xsl:text> := </xsl:text>
      <xsl:value-of select="@expr"/>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:send" mode="chart">
    <div class="line">
      <xsl:text>(send event </xsl:text>
      <b><xsl:value-of select="@event"/></b>
      <xsl:if test="@id">
        <xsl:text>, ID </xsl:text>
        <xsl:value-of select="@id"/>
      </xsl:if>
      <xsl:if test="@delay">
        <xsl:text>, after </xsl:text>
        <xsl:value-of select="@delay"/>
      </xsl:if>
      <xsl:text>)</xsl:text>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:cancel" mode="chart">
    <div class="line">
      <xsl:text>(cancel delayed event with ID </xsl:text>
      <xsl:value-of select="@sendid"/>
      <xsl:text>)</xsl:text>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:script" mode="chart">
    <div class="line code">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match ="scxml:invoke" mode="chart">
    <div class="line code">
      <xsl:value-of select="scxml:content"/>
    </div>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
 
  <xsl:template match ="*" mode="chart">
    {<xsl:value-of select="name()"/>}
  </xsl:template>

</xsl:stylesheet>
