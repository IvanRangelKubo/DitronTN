{% paginate by settings.category_quantity_products %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, products_count: products_count, query: query } %}
  {% block page_header_text %}
    {% if query %}
      Se han encontrado {{ products_count }} resultado{{ products_count == 1 ? '' : 's' }} para "{{ query }}"
    {% else %}
      Resultados de búsqueda
    {% endif %}
  {% endblock page_header_text %}
{% endembed %}

<section class="container-listing">

	<div class="contitemslisting">

			{% if products %}
				<div class="itemlisting">
					{% include 'snipplets/product_grid.tpl' %}
				</div>
			{% else %}
				<div class="customcontainer">
					<div class="not-found-div">
						<img loading="lazy" src="{{ "images/search_icon_1.svg" | static_url }}" alt="Not found icon" class="imgsearch">
						<h4 class="no-reults-txt">LO SENTIMOS<br>Tu búsqueda no produjo ningún resultado intenta nuevamente con otra palabra.</h4>
					</div>
				</div>
			{% endif %}
		
	</div>

	{% include 'snipplets/grid/pagination.tpl' with { infinite_scroll: false } %}

</section>