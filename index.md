---
layout: list
title: Brecht & Mieke's blog
section: Home
feed: atom.xml
---
<div id="container">
{% for post in site.posts  %}
  <div class="item story-container">
    <img src="http://placekitten.com/300/250">
<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
<p>{{ post.date | date_to_long_string }}</p>
<p class="excerpt">{{ post.summary }}</p>
<p class="postauthor">{{ post.author }}</p>
  </div>
{% endfor %}
</div>


