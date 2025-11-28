{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by settings.category_quantity_products %}
{% else %}
	{% paginate by settings.category_quantity_products %}
{% endif %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}


{% if not category_banner %}
	{% embed "snipplets/page-header.tpl" with {container: false} %}
		{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
	{% endembed %}
{% endif %}

{% if category_banner %}
		{% include 'snipplets/category-banner.tpl' %}
{% endif %}

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




<section class="container-listing" data-store="category-grid-{{ category.id }}">

	{% include 'snipplets/grid/product-list.tpl' %}

</section>

{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}


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

button.js-price-filter-btn.btn.btn-default.d-inline-block.disabled {
    border-radius: 9px;
}

span.checkbox-text.with-color {
    font-size: medium;
}

span.radio-button-label {
    font-size: small !important;
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