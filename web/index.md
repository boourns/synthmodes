---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

Collection of mobile-friendly synthesizer cheat sheets.
{% assign manufacturers = site.pages | group_by: 'manufacturer' | sort: 'name' %}
{%- for manufacturer in manufacturers -%}
<br><b>{{ manufacturer.name }}</b><br>
{% assign pages = manufacturer.items | sort: 'title' %}
	{%- for my_page in pages -%}
	  {%- if my_page.title -%}
	  	<a class="page-link" href="{{ my_page.url | relative_url }}">{{ my_page.title | escape }}</a><br />
	  {%- endif -%}
  	{%- endfor -%}
{%- endfor -%}