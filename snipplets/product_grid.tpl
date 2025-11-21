{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}
    <div class="itemlisting">
        {% include 'snipplets/grid/item.tpl' %}
    </div>
{% endfor %}