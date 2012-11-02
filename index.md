---
layout: list
title: Brecht & Mieke's blog
section: Home
feed: atom.xml
---
<div id="container">
{% for post in site.posts  %}
  <div class="item story-container shadow">
    <a href="{{ post.url }}">
      <img src="{% if post.front_image %}{{ post.front_image }}{% else %}/images/placeholder.jpg{% endif %}"></a>
    <div class="story-text">
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p>{{ post.date | date_to_long_string }}</p>
      <p class="excerpt">{{ post.summary }}</p>
      <p class="postauthor">{{ post.author }}</p>
    </div>
  </div>
{% endfor %}
</div>


