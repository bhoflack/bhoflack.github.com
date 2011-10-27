---
layout: list
title: Brecht & Mieke's blog
section: Home
feed: atom.xml
---
Dit is de reisblog van Brecht en Mieke.  In deze blog gaan we onze reisverhalen van onze reis naar India verzamelen om ze met onszelf en anderen te kunnen delen.

Tijdens onze reis naar India plannen we New Delhi,  Agra,  Jaipur,  Pushkar,  Ranthambor National Park,  Udaipur,  Jodhpur en Jaisalmer aan te doen.  Het word dus een drukke reis waarin we hopelijk veel gaan beleven!

Deze blog bevat een [atom feed](/atom.xml) zodat je ons kan volgen in je nieuws reader.  Daarnaast bevat iedere blog post pagina de mogelijkheid om comments te plaatsen.

<div class='section list'>
{% for post in site.posts  %}
<h1>{{ post.date | date_to_long_string }}</h1>
<p class="line">
  <a href="{{ post.url }}">{{ post.title }}</a>
    <a href="{{ post.url }}#disqus_thread" class="comments">View Comments</a></p>
<p class="excerpt">{{ post.summary }}</p>
<p class="postauthor">{{ post.author }}</p>
{% endfor %}
</div>


