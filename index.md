---
layout: list
title: Brecht & Mieke's blog
section: Home
feed: atom.xml
---
<div class="container">
{% for post in site.posts  %}
  <div class="row">
    <div class="small-12 columns">
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p class="summary">{{ post.summary }}</p>
      <p class="author">{{ post.author }} in {{ post.location }}</p>
    </div>
  </div>
{% endfor %}
</div>
