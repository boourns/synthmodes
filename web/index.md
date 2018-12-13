---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

Collection of mobile-friendly synthesizer cheat sheets.<br /><br />

{%- for my_page in site.pages -%}
  {%- if my_page.title -%}
  <a class="page-link" href="{{ my_page.url | relative_url }}">{{ my_page.title | escape }}</a><br />
  {%- endif -%}
{%- endfor -%}
<br /><br />
<a href="https://itunes.apple.com/ca/app/modes/id1445358435?mt=8"><img src="assets/appstore.svg"><br />Get SynthModes for iOS</a>