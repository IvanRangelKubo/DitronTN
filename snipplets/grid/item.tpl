{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% if template == 'home'%}
    {% set columns_desktop = section_columns_desktop %}
    {% set columns_mobile = section_columns_mobile %}
    {% set section_slider = section_slider %}
{% else %}
    {% set columns_desktop = settings.grid_columns_desktop %}
    {% set columns_mobile = settings.grid_columns_mobile %}
    {% if template == 'product'%}
        {% set section_slider = true %}
    {% endif %}
{% endif %}

{# Item image slider #}

{% set show_image_slider = 
    (template == 'category' or template == 'search')
    and settings.product_item_slider 
    and not reduced_item 
    and not has_filters
    and product.other_images
%}

{% if show_image_slider %}
    {% set slider_controls_container_class = 'item-slider-controls-container svg-icon-text d-none d-md-block' %}
    {% set control_next_svg_id = 'arrow-long' %}
    {% set control_prev_svg_id = 'arrow-long' %}
{% endif %}

{# Secondary images #}

{% set show_secondary_image = settings.product_hover %}


    <div class="js-item-product" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}">
        
        {% if (settings.quick_shop or settings.product_color_variants) and not reduced_item %}
            <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %} container-producto" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}">
        {% endif %}

        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

            {# Set how much viewport space the images will take to load correct image #}

            {% if params.preview %}
                {% set mobile_image_viewport_space = '100' %}
                {% set desktop_image_viewport_space = '50' %}
            {% else %}
                {% if columns_mobile == 2 %}
                    {% set mobile_image_viewport_space = '50' %}
                {% else %}
                    {% set mobile_image_viewport_space = '100' %}
                {% endif %}

                {% if columns_desktop == 4 %}
                    {% set desktop_image_viewport_space = '25' %}
                {% elseif columns_desktop == 3 %}
                    {% set desktop_image_viewport_space = '33' %}
                {% else %}
                    {% set desktop_image_viewport_space = '50' %}
                {% endif %}

            {% endif %}

            <div class="contimgproducto">
                {% if not product.has_stock %}
                    <div class="etiquetas-prod">Agotado</div>
                {% endif %}
                {% if product.compare_at_price > product.price %}
                    <div class="etiquetas-prod oferta">-{{ (((product.compare_at_price - product.price) * 100) / product.compare_at_price) | round(0, 'floor') }}%</div>
                {% endif %}
              <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="linkproducto w-inline-block">
                  {% if product.images_count > 1 %}
                    <div style="background-image:url({{ product.images[1] | product_image_url('original') }})" class="imgback" ></div>
                  {% else %}
                    <div style="background: transparent" class="imgback" ></div>
                  {% endif %}

                  {# armamos la URL "real" de la imagen destacada #}
                  {% set featured_url = product.featured_image | product_image_url('original') %}
                  {# en TN, cuando no hay imagen, la URL incluye "no-photo" #}
                  {% set has_real_image = featured_url and ('no-photo' not in featured_url) %}

                  {% if has_real_image %}
                    <div class="imgfront {% if product.images_count > 1 %}hoverOn{% endif %}"
                        style="background-image:url({{ featured_url }})"></div>
                  {% else %}
                    <div class="imgfront {% if product.images_count > 1 %}hoverOn{% endif %}"
                        style="background-image:url({{ 'images/llanta_ejemplo.jpg' | static_url }})"></div>
                  {% endif %}
              </a>
            </div>

            {% if 
                ((settings.quick_shop and not product.isSubscribable()) or settings.product_color_variants)
                and product.available 
                and product.display_price 
                and product.variations 
                and not reduced_item 
            %}

                {# Hidden product form to update item image and variants: Also this is used for quickshop popup #}

                <div class="js-item-variants hidden">
                    <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% if product.variations %}
                            {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                        {% endif %}
                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                        {# Add to cart CTA #}

                        {% set show_product_quantity = product.available and product.display_price %}

                        <div class="row">

                            {% if show_product_quantity %}
                                {% include "snipplets/product/product-quantity.tpl" with {quickshop: true} %}
                            {% endif %}

                            <div class="js-buy-button-container {% if show_product_quantity %}col-8 pl-md-0{% else %}col-12{% endif %} buy-button-container">

                                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big w-100 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                                {# Fake add to cart CTA visible during add to cart event #}

                                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}
                            </div>
                        </div>
                    </form>
                </div>

            {% endif %}

            {% set show_labels = not product.has_stock or product.compare_at_price or product.hasVisiblePromotionLabel %}

            <div class="container-titleandprices" data-store="product-item-info-{{ product.id }}">
                <div class="contstarsreviews"></div>
                <a href="{{ product_url_with_selected_variant }}" class="js-item-name nombre-producto" data-store="product-item-name-{{ product.id }}">{{ product.name }}</a>

                {% if product.display_price %}
                    <div class="item-price-container" data-store="product-item-price-{{ product.id }}">
                        <span class="js-price-display item-price" data-product-price="{{ product.price }}">
                            {{ product.price | money }}
                        </span>
                        {% if not reduced_item %}
                            <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                                {{ product.compare_at_price | money }}
                            </span>
                        {% endif %}

                        {{ component('payment-discount-price', {
                                visibility_condition: settings.payment_discount_price and not reduced_item,
                                location: 'product',
                                container_classes: "font-smallest mt-1",
                            }) 
                        }}

                        {% if settings.product_installments and not reduced_item %}
                            {{ component('installments', {'location' : 'product_item', container_classes: { installment: "item-installments mt-2"}}) }}
                        {% endif %}

                        {% if not reduced_item %}
                            {{ component('subscriptions/subscription-message', {
                                subscription_classes: {
                                    container: 'font-smallest mt-1',
                                },
                            }) }}
                        {% endif %}

                    </div>

                {% endif %}
                
            </div>

            {% if product.available and product.display_price and settings.quick_shop and not reduced_item %}
                {% if settings.quick_shop %}

                    {% set quickshop_button_classes = 'btn-link btn-small-quickshop' %}

                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                    <!--CTA-->
                    <div class="item-actions mt-2 pt-1">

                        {% if product.isSubscribable() %}

                            {# Product with subscription will link to the product page #}

                            <span class="{{ quickshop_button_classes }}" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}">
                                <span>{{ texts[state] | translate }}</span>
                                <svg class="icon-inline ml-1"><use xlink:href="#bag-small"/></svg>
                            </span>

                        {% else %}
                            {% if product.variations %}

                                {# Open quickshop popup if has variants #}

                                <span data-toggle="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" class="js-quickshop-modal-open js-fullscreen-modal-open js-modal-open btn-link" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}">
                                    <span class="js-open-quickshop-wording">{{ 'Comprar' | translate }}</span>
                                    <svg class="js-open-quickshop-icon icon-inline ml-1"><use xlink:href="#bag-small"/></svg>
                                </span>
                            {% else %}
                                {# If not variants add directly to cart #}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />

                                    <div class="js-item-submit-container item-submit-container position-relative">
                                        <input type="submit" class="js-addtocart js-prod-submit-form btn-link btn-small-quickshop {{ state }}" value="{{ texts[state] | translate }}" alt="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"/>
                                        <svg class="js-quickshop-bag icon-inline item-quickshop-icon"><use xlink:href="#bag-small"/></svg>
                                    </div>

                                    {# Fake add to cart CTA visible during add to cart event #}

                                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {direct_add: true} %}
                                </form>
                            {% endif %}
                        {% endif %}
                    </div>
                    <!--CTA-->
                {% endif %}
            {% endif %}
            
            {% if (settings.quick_shop or settings.product_color_variants) and not reduced_item %}
                </div>
            {% endif %}

            {{ component('structured-data', {'item': true}) }}
        
    </div>