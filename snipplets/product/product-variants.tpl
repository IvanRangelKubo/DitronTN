<div class="js-product-variants {% if quickshop %}js-product-quickshop-variants{% endif %} form-row {% if not settings.bullet_variants %}mb-2{% endif %}">
	{% set has_size_variations = false %}
	{% if settings.bullet_variants %}
		{% set hidden_variant_select = ' d-none' %}
	{% endif %}
	{% for variation in product.variations %}
		{% if variation.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
			{% set has_size_variations = true %}
		{% endif %}

		{% if settings.image_color_variants and not (settings.bullet_variants)  %}
			{% if variation.name in ['Color', 'Cor'] %}
				{% set hidden_variant_select = ' d-none' %}
			{% else %}
				{% set hidden_variant_select = ' d-block' %}
			{% endif %}
		{% endif %}

		{% set is_button_variant = settings.bullet_variants or (settings.image_color_variants and variation.name in ['Color', 'Cor']) %}
		<div class="js-product-variants-group {% if variation.name in ['Color', 'Cor'] %}js-color-variants-container{% endif %} {% if is_button_variant %}form-group col-12 text-center text-md-left {% if loop.last and not (show_size_guide and settings.size_guide_url and has_size_variations) %}mb-4{% else %}mb-2{% endif %}{% else %}{% if loop.length == 1 or loop.length == 3 or settings.image_color_variants %}col-12 col-md-8{% else %}col-6{% endif %}{% endif %}" data-variation-id="{{ variation.id }}">
			{% if quickshop %}
				{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_group_custom_class: hidden_variant_select, select_custom_class: 'js-variation-option js-refresh-installment-data'} %}
					{% block select_options %}
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] is same as(option.id) %}selected="selected"{% endif %}>{{ option.name }}</option>
						{% endfor %}
					{% endblock select_options%}
				{% endembed %}
			{% else %}
				{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data', select_group_custom_class: hidden_variant_select} %}
					{% block select_options %}
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] is same as(option.id) %}selected="selected"{% endif %}>{{ option.name }}</option>
						{% endfor %}
					{% endblock select_options%}
				{% endembed %}
			{% endif %}
			{% if is_button_variant %}
				<label class="form-label text-center text-md-left">{{ variation.name }}: <span class="js-insta-variation-label">{{ product.default_options[variation.id] }}</span></label>
				{% for option in variation.options %}

					<a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant{% if product.default_options[variation.id] is same as(option.id) %} selected{% endif %}{% if variation.name in ['Color', 'Cor'] %} {% if option.custom_data or settings.image_color_variants %}btn-variant-color varImage{% endif %} p-0{% endif %}" title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}">
					
						<span class="btn-variant-content{% if settings.image_color_variants and variation.name in ['Color', 'Cor'] %} btn-variant-content-square varImage{% endif %}"{% if option.custom_data and variation.name in ['Color', 'Cor'] and (settings.bullet_variants and not settings.image_color_variants) %} style="background: {{ option.custom_data }}; border: 1px solid #eee"{% endif %} data-name="{{ option.name }}">
							{% if settings.image_color_variants and variation.name in ['Color', 'Cor'] %}
								{% if product.default_options[variation.id] is same as(option.id) %}
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ product.featured_variant_image | product_image_url('thumb')}}" data-sizes="auto" class="lazyload absolute-centered-vertically" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
								{% else %}
									{% for variant in product.variants if (variant.option1 == option.id) or (variant.option2 == option.id) or (variant.option3 == option.id) %}
										{% if loop.first %}
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ variant.image | product_image_url('thumb') }}" data-sizes="auto" class="lazyload absolute-centered-vertically" />
										{% endif %}
									{% endfor %}
								{% endif %}
							{% endif %}
							{% if not(variation.name in ['Color', 'Cor']) or ((variation.name in ['Color', 'Cor']) and not option.custom_data and not settings.image_color_variants) %}
								{{ option.name }}
							{% endif %}

						</span>
					</a>

				{% endfor %}
			{% endif %}
		</div>
	{% endfor %}
	{% if show_size_guide and settings.size_guide_url and has_size_variations %}
		{% set has_size_guide_page_finded = false %}
		{% set size_guide_url_handle = settings.size_guide_url | trim('/') | split('/') | last %}

		{% for page in pages if page.handle == size_guide_url_handle and not has_size_guide_page_finded %}
			{% set has_size_guide_page_finded = true %}
			{% if has_size_guide_page_finded %}
				<a data-toggle="#size-guide-modal" data-modal-url="modal-fullscreen-size-guide" class="js-modal-open js-fullscreen-modal-open font-small col-12 pb-2 mb-2">
					<span class="btn-link font-small">{{ 'Guía de talles' | translate }}</span>
				</a>
				{% embed "snipplets/modal.tpl" with{modal_id: 'size-guide-modal',modal_class: 'bottom-md', modal_position: 'right modal-centered-md', modal_transition: 'slide', modal_header_title: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
					{% block modal_head %}
						{{ 'Guía de talles' | translate }}
					{% endblock %}
					{% block modal_body %}
						<div class="user-content">
							{{ page.content }}
						</div>
					{% endblock %}
				{% endembed %}
			{% endif %}
		{% endfor %}
	{% endif %}
</div>

<style>
	img.absolute-centered-vertically.lazyautosizes.ls-is-cached.lazyloaded {
			width: auto;
			max-height: 42px;
			margin-left: auto;
			margin-right: auto;
			display: block;
	}

	span.btn-variant-content.btn-variant-content-square.varImage {
			max-width: 100%;
			display: inline-block;
			cursor: pointer;
			border-radius: 0;
			flex: none;
			margin-left: 4px;
			margin-right: 4px;
			padding: 2px;
			transition: all .35s;
			overflow: auto;
	}

	a.js-insta-variant.btn.btn-variant.btn-variant-color.p-0.varImage.selected {
    border-width: 2px;
    border-color: var(--ditron-blue);
	}

	a.js-insta-variant.btn.btn-variant.btn-variant-color.p-0.varImage {
			border: 1px solid #454545;
			width: 50px;
			height: 48px;
	}

	a.js-insta-variant.btn.btn-variant.selected {color: #fff;background-color: #454545;border-width: 1px;border-color: #245346;text-decoration: none;}

	a.js-insta-variant.btn.btn-variant.selected.varImage {
			background-color: transparent;
	}

	a.js-insta-variant.btn.btn-variant {
			color: #454545;
			text-align: center;
			cursor: pointer;
			border: 1px solid #454545;
			justify-content: center;
			align-items: center;
			width: auto;
			height: 30px;
			margin-top: 2px;
			margin-bottom: 2px;
			margin-right: 5px;
			padding: 2px 10px;
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
			font-size: 14px;
			font-weight: 600;
			line-height: 14px;
			text-decoration: none;
			display: inline-block;
			overflow: hidden;
	}

	a.js-insta-variant.btn.btn-variant:hover {
			background-color: black;
			color: white;
	}

	a.js-insta-variant.btn.btn-variant.btn-variant-color.varImage.p-0:hover {
			background: transparent;
	}

	@media screen and (max-width: 767px) {
		img.absolute-centered-vertically.lazyautosizes.ls-is-cached.lazyloaded {
				width: auto;
				max-height: 42px;
				margin-left: auto;
				margin-right: auto;
				display: block;
				position: relative;
				top: auto;
				left: auto;
		}
	}
</style>