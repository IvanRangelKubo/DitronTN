<div class="continfovip">

    {% if 'nuevo' in product.tags and product.has_stock %}
        <div class="tagnuevovip">NUEVO</div>
    {% endif %}
    {# Product name #}
    <h1 class="titleproductvip">{{ product.name }}</h1>

    {# Product price #}

    <div class="contprecios-vip">
        {% if product.compare_at_price or product.promotional_offer %}
            <div id="compare_price_display" class="js-compare-price-display precio-vip" style="text-decoration: line-through;">{{ product.compare_at_price | money }}</div>
            <div id="price_display" data-product-price="{{ product.price }}" class="js-price-display precio-vip oferta">{{ product.price | money }}</div>
        {% else %}
            <div id="price_display" data-product-price="{{ product.price }}" class="js-price-display preciovip">{{ product.price | money }}</div>
        {% endif %} 
        {% if product.compare_at_price > product.price %}
            <div class="tagsvip">-{{ (((product.compare_at_price - product.price) * 100) / product.compare_at_price) | round(0, 'floor') }}%</div>
        {% endif %}
    </div>

    {# Product form, includes: Variants, CTA and Shipping calculator #}
     <form id="product_form" class="js-product-form mt-4" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
        {% if template == "product" %}
            {% set show_size_guide = true %}
        {% endif %}
        {% if product.variations %}
            {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
        {% endif %}

        {% if settings.last_product and show_product_quantity %}
            <div class="{% if product.variations %}js-last-product{% endif %} text-center text-md-left text-accent mb-3"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                {{ settings.last_product_text }}
            </div>
        {% endif %}

        <div class="row {% if settings.product_stock %}mb-3{% else %}mb-4{% endif %}">
            {% if show_product_quantity %}
                {% include "snipplets/product/product-quantity.tpl" %}
            {% endif %}

            {{ component('subscriptions/subscription-selector', {
                subscription_classes: {
                    container: 'radio-button-container col-12 mt-2 mb-2',

                    radio_button: 'radio-button-item card p-3 mb-2 overflow-visible',
                    radio_button_label: 'ml-1',
                    radio_button_text: 'row',
                    radio_button_icon: 'radio-button-icons',

                    purchase_option_info_container: 'col-auto font-small pr-0',
                    purchase_option_price: 'col text-right',
                    purchase_option_single_frequency: 'mt-2 pt-1 font-small opacity-80',
                    purchase_option_discount: 'label label-accent ml-2 py-1',

                    dropdown_container: 'form-group mt-3 mb-0',
                    dropdown_button: 'form-select p-2',
                    dropdown_icon: 'form-select-icon icon-inline icon-w-14 icon-rotate-90',
                    dropdown_options: 'form-select-options',
                    dropdown_option: 'form-select-option row no-gutters',
                    dropdown_option_info: 'col pr-4',
                    dropdown_option_price: 'col-auto',
                    dropdown_option_discount: 'text-accent mt-1',

                    cart_alert: 'font-small text-center mt-2',
                    shipping_message: 'font-small mb-3',
                    shipping_message_title: 'form-label mb-2 pb-1',
                    shipping_message_text: 'box',
                    
                    legal_message: 'font-smallest text-center w-100 mb-2 px-3',
                    legal_link: 'font-smallest btn-link btn-link-primary p-0',
                    legal_modal: 'bottom modal-centered-small modal-centered transition-soft',
                    legal_modal_header: 'modal-header row no-gutters',
                    legal_modal_title: 'col offset-2',
                    legal_modal_close_button: 'col-2 pr-3 pr-md-0 text-right',
                    legal_modal_close_icon: 'icon-inline svg-icon-text',
                    legal_modal_body: 'mb-4',
                    legal_modal_details_title: 'mb-3',
                    legal_modal_details_paragraph: 'font-small pb-4 mb-0',
                    legal_modal_details_link: 'font-small btn-link btn-link-primary p-0'
                },
                dropdown_icon: true,
                dropdown_icon_svg_id: 'chevron',

                legal_modal_close_icon_id: 'times',
            }) }}
            
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

            {% set btn_container_classes = show_product_quantity and not product.isSubscribable() ? 'col-8 pl-md-0' : 'col-12' %}

            <div class="js-buy-button-container {{ btn_container_classes }} {% if product.isSubscribable() %}mt-1{% endif %}">

                {# Add to cart CTA #}

                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

                {# Fake add to cart CTA visible during add to cart event #}

                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}

            </div>

            {% if settings.ajax_cart %}
                <div class="col-12">
                    <div class="js-added-to-cart-product-message font-small mt-2 mb-3" style="display: none;">
                        <span>
                            {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link font-small ml-1 text-center text-md-left" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                        </span>
                    </div>
                </div>
            {% endif %}

            {# Free shipping visibility message #}

            {% set free_shipping_minimum_label_changes_visibility = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% if not product.is_non_shippable and show_product_quantity and has_free_shipping and not has_product_free_shipping %}

                {# Free shipping add to cart message #}

                {% if include_product_free_shipping_min_wording %}

                    {% include "snipplets/shipping/shipping-free-rest.tpl" with {'product_detail': true} %}

                {% endif %}

                {# Free shipping achieved message #}

                <div class="js-product-form-free-shipping-message {% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} text-accent font-small mx-3 my-3" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                    {{ "¡Genial! Tenés envío gratis" | translate }}
                </div>

            {% endif %}
        </div>

        {% if template == 'product' %}

            {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

            {% if show_product_fulfillment %}
                <div class="mb-4 {% if store.branches %}pb-2{% endif %}">

                    {# Shipping calculator and branch link #}

                    <div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                        {% if store.has_shipping %}
                            {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                        {% endif %}
                    </div>

                    {% if store.branches %}
                        {# Link for branches #}
                        {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
                    {% endif %}
                </div>

            {% endif %}
        {% endif %}
     </form>

    <div class="promovip">
        <img loading="lazy" src="{{ "images/envios_icon.svg" | static_url }}" alt="free_shiping_icon" class="iconvip">
        <div class="titulovip-elements"><span class="bluetxtvip">ENVÍOS GRATIS</span> a partir de $1,500 MXN </div>
    </div>

    <div class="promovip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
        <img src="" alt="" class="mediopago vip">
    </div>

    {% if product.description is not empty %}

        <div class="contitlecust">
            <h2 class="secctilte vip">Descripción</h2>
            <div class="linetitle"></div>
        </div>

        <div id="barritascroll" class="infodescrip">
            <p class="pdescrip" data-store="product-description-{{ product.id }}">
                {{ product.description | raw }}
            </p>
        </div>
    
    {% endif %}

</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
    const wrapper = document.getElementById("barritascroll");

    if (wrapper) {
        // Encuentra nodos huérfanos fuera del <p>
        const children = Array.from(wrapper.childNodes);
        children.forEach(node => {
        if (node.nodeType === 1 && !node.classList.contains("pdescrip")) {
            // lo meto dentro del <p>
            let p = wrapper.querySelector(".pdescrip");
            if (!p) {
            p = document.createElement("p");
            p.className = "pdescrip";
            wrapper.appendChild(p);
            }
            p.appendChild(node);
        }
        });
    }
    });
</script>
