{# Related products visibility conditions #}

{% set related_products = [] %}
{% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
{% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}
{% if has_related_products_from_app %}
    {% set related_products = related_products_ids_from_app | get_products %}
{% endif %}
{% if related_products is empty %}
    {% set max_related_products_length = 8 %}
    {% set max_related_products_achieved = false %}
    {% set related_products_without_stock = [] %}
    {% set max_related_products_without_achieved = false %}

    {% if related_tag %}
        {% set products_from_category = related_products_from_controller %}
    {% else %}
        {% set products_from_category = category.products | shuffle %}
    {% endif %}

    {% for product_from_category in products_from_category if not max_related_products_achieved and product_from_category.id != product.id %}
        {%  if product_from_category.stock is null or product_from_category.stock > 0 %}
            {% set related_products = related_products | merge([product_from_category]) %}
        {% elseif (related_products_without_stock | length < max_related_products_length) %}
            {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
        {% endif %}
        {%  if (related_products | length == max_related_products_length) %}
            {% set max_related_products_achieved = true %}
        {% endif %}
    {% endfor %}
    {% if (related_products | length < max_related_products_length) %}
        {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
        {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}

        {% set related_products = related_products | merge(related_products_for_refill)  %}
    {% endif %}
{% endif %}

{% set complementary_products = complementary_product_list | length > 0 %}

{# Show alternative products when there are default category alternatives with no complementaries or manually selected alternatives #}
{% set alternative_products = related_products | length > 0 and not (complementary_products and source_alternative == 'default') %}

{# Set related products classes #}

{% set section_class = 'section-products-related position-relative ' %}
{% set alternative_section_class = complementary_products ? 'pb-2 pb-md-4' %}
{% set container_class = 'container px-0 px-md-4' %}
{% set title_class = 'h3 section-title mb-4 text-center' %}
{% set slider_container_class = 'swiper-container' %}
{% set swiper_wrapper_class = 'swiper-wrapper' %}
{% set slider_controls_container_class = 'text-center' %}
{% set slider_control_class = 'icon-inline icon-lg' %}
{% set slider_control_prev_class = 'swiper-button-prev' %}
{% set slider_control_next_class = 'swiper-button-next' %}
{% set control_next_svg_id = 'arrow-long' %}
{% set control_prev_svg_id = 'arrow-long' %}

{# Alternative products #}

{% set alternative_data_component = source_alternative == 'default' ? 'related-products' : 'alternative-products' %}


{% if alternative_products %}
        <div class="customcontainer">

            <div class="contitlecust">
                <h2 class="secctilte">
                    {{ settings.products_related_title }}
                </h2>
                <div class="linetitle"></div>
            </div>

            <div class="customhtml w-embed">
                <div class="owl-carousel productosowl owl-theme" id="related-owl">

                    {% for product in related_products %}
                    {% include "snipplets/grid/item.tpl" with { product: product } %}
                    {% endfor %}

                </div>
            </div>

        </div>
{% endif %}

{# Complementary products #}

{% set complementary_section_id = 'complementary-products' %}

{% if complementary_products %}

    <div class="customcontainer">

        <div class="contitlecust">
        <h2 class="secctilte">
            {{ settings.products_complementary_title }}
        </h2>
        <div class="linetitle"></div>
        </div>

        <div class="customhtml w-embed">
        <div class="owl-carousel productosowl owl-theme" id="complementary-owl">

            {% for product in complementary_product_list %}
            {% include "snipplets/grid/item.tpl" with { product: product } %}
            {% endfor %}

        </div>
        </div>

    </div>
{% endif %}

