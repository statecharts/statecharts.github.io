---
permalink: /glossary/index.html
---

# Full list of glossary terms:

{% assign something = "something" %}

{% assign allitems = "" | split:"" %}
{% for item in site.glossary %}
  {% assign allitems = allitems | push: item %}
  {% if item.aka | size > 0 %}
    {% for aka in item.aka %}
      {% assign allitems = allitems | push: aka %}
    {% endfor %}
  {% endif %}
{% endfor %}
<ul>
{% for item in allitems | sort: 'title' %}
  <li><a href="{{ item.url }}">{{ item.title }}</a> — {{ item.oneliner }}</li>
{% endfor %}
</ul>
