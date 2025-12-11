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

<div class="customcontainer">
{% if products %}
	<div class="SortAndFilters">
		<div class="filtersAndAplicated">
			{% include "snipplets/grid/horizontal-filters.tpl" %}
		</div>

		<div class="filterCont mb-3 pb-1">
				<div class="filterActivator" role="button" aria-expanded="false" tabindex="0">
					Ordenar
				</div>

				<div class="filterContainer js-price-filter-container price-filter-container mb-3 pb-1 sortContainer" aria-hidden="true">
					{{ component(
					'sort-by',{
						list: true,
						list_title: false,
						svg_sprites: true,
						sort_by_classes: {
							list: "list-unstyled radio-button-container",
							list_item: "radio-button-item",
							radio_button: "radio-button",
							radio_button_content: "radio-button-content",
							radio_button_icons_container: "radio-button-icons-container",
							radio_button_icons: "radio-button-icons",
							radio_button_icon: "radio-button-icon",
							radio_button_label: "radio-button-label",
							applying_feedback_message: "h5 mr-2",
							applying_feedback_icon: "icon-inline h5 icon-spin icon-w-2em svg-icon-text ml-2"
						},
						applying_feedback_svg_id: "spinner-third",
					})
				}}
				</div>
		</div>

	</div>

	<div class="MobileFilters">
		{% include "snipplets/grid/filters-modals.tpl" %}
	</div>
{% endif %}
</div>

<section class="container-listing">
	<div class="customcontainer">
		<div class="contitemslisting">
			{% if products %}
					{% include 'snipplets/product_grid.tpl' %}
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
	</div>
</section>

<style>
.SortAndFilters {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0px 20px;
}

.sortContainer {
    left: -80%;
		font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
}

.filterActivator {
    font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
}

.filterCont {
	position: relative;
}

.sortContainer {
	position: absolute;
	top: 100%;
	right: 0; /* Se pega al borde derecho */
	z-index: 50;
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 10px;
	min-width: 180px; /* Ajustable */
	box-shadow: 0 4px 12px rgba(0,0,0,0.12);
	font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
}

input.js-price-filter-input.form-control.filter-input-price {
    border-radius: 9px;
}

button.js-price-filter-btn.btn.btn-default.d-inline-block.disabled, button.js-price-filter-btn.btn.btn-default.d-inline-block {
    border-radius: 9px;
    background-color: var(--ditron-blue);
}

@media (max-width: 767px) {
    .SortAndFilters {
        display: none !important;
    }

    .MobileFilters {
        display: block !important;
    }

		.font-small.font-weight-bold.mb-4 {
				display: block;
		}

		a.js-modal-open.btn-link {
			border: 2px solid var(--ditron-blue);
			border-radius: 9px;
			padding: 5px 20px;
			text-decoration: none;
			"Elmssans Variablefont Wght", Verdana, font-family: sans-serif;
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
			font-weight: 600;
		}

		.container.category-controls-container.text-center {
				margin-top: 10px;
		}

		div#filters {
			display: flex;
			flex-direction: column;
			align-items: flex-start;
			padding: 0px;
		}

		.font-small.font-weight-bold.mb-4 {
				font-size: large !important;
				color: var(--ditron-blue);
				font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
		}

		span.radio-button-label {
			font-size: 15px !important;
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
		}


		a.btn-link.font-small.no-underline {
				font-size: 15px !important;
				font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
		}

		span.checkbox-text.with-color {
				font-size: 15px !important;
				font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
		}

		.js-modal-close.modal-header {
				background: transparent;
				border-bottom: 1px solid gainsboro;
		}

		.col.px-3.pr-md-3.pl-md-5 {
				font-size: larger;
				color: var(--ditron-blue);
				font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
				font-weight: 600;
		}
}


@media (min-width: 768px) {

    .MobileFilters {
        display: none !important;
    }
}

</style>