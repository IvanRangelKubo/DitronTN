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
            <div id="price_display" data-product-price="{{ product.price }}" class="js-price-display precio-vip">{{ product.price | money }}</div>
        {% endif %} 
        {% if product.compare_at_price > product.price %}
            <div class="tagsvip">-{{ (((product.compare_at_price - product.price) * 100) / product.compare_at_price) | round(0, 'floor') }}%</div>
        {% endif %}
    </div>

    {# Product form, includes: Variants, CTA and Shipping calculator #}
    <div class="formvip w-form">
     <form id="product_form" class="js-product-form vip-variacinqty-selection" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">

        <input type="hidden" name="add_to_cart" value="{{product.id}}" />

        {% if product.variations %}
            {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
        {% endif %}

        <div class="cont-variacion qty">
            

            {% if product.available and product.display_price %}
                {% include "snipplets/product/product-quantity.tpl" %}
            {% endif %}
            
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
            {% set jsClasses = ''%}
            {% set btnType = 'button' %}
            {% if state != 'nostock' %}
                {% set jsClasses = 'js-addtocart js-prod-submit-form' %}
                {% set btnType = 'submit' %}
            {% endif %}

            {% set btn_container_classes = show_product_quantity and not product.isSubscribable() ? 'col-8 pl-md-0' : 'col-12' %}

            <div class="js-buy-button-container cont-variacion">

                {# Add to cart CTA #}

                <input type="{{ btnType }}" class="{{ jsClasses }} btn-add-to-cart btn btn-primary btn-big btn-block btn-vip w-button {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

                {# Fake add to cart CTA visible during add to cart event #}

                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-vip w-button"} %}

            </div>

        </div>

     </form>
    </div>

    {% if settings.show_free_shiping %}
        <div class="promovip">
            <img loading="lazy" src="{{ "images/envios_icon.svg" | static_url }}" alt="free_shiping_icon" class="iconvip">
            <div class="titulovip-elements"><span class="bluetxtvip">ENVÍOS GRATIS</span> {{ settings.free_shiping_label }} </div>
        </div>  
    {% endif %}

    <div class="promovip">
        <img src="{{ "payment_1.jpg" | static_url }}" alt="{{ settings.payment_1_alt }}" class="mediopago vip">
        <img src="{{ "payment_2.jpg" | static_url }}" alt="{{ settings.payment_2_alt }}" class="mediopago vip">
        <img src="{{ "payment_3.jpg" | static_url }}" alt="{{ settings.payment_3_alt }}" class="mediopago vip">
        <img src="{{ "payment_4.jpg" | static_url }}" alt="{{ settings.payment_4_alt }}" class="mediopago vip">
        <img src="{{ "payment_5.jpg" | static_url }}" alt="{{ settings.payment_5_alt }}" class="mediopago vip">
        <img src="{{ "payment_6.jpg" | static_url }}" alt="{{ settings.payment_6_alt }}" class="mediopago vip">
        <img src="{{ "payment_7.jpg" | static_url }}" alt="{{ settings.payment_7_alt }}" class="mediopago vip">
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

<style>
    label.form-label.text-center.text-md-left {
        display: none;
    }

    .form-quantity.form-quantity-product.d-flex.form-row.m-0.align-items-center {
        border: 1px solid #454545;
        border-radius: 9px;
        font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
        color: #454545;
        width: 165px;
    }

    .form-quantity-product svg {
        font-size: 12px;
    }

    .js-addtocart.js-addtocart-placeholder.btn.btn-primary.btn-block.btn-transition.btn-big.disabled {
        background-color: transparent;
        color: white;
        fill: white;
    }

    .form-group.js-quantity {
        margin-bottom: 0px;
    }

        .d-inline-block.btnagregar.w-button {
            height: 0;
            margin: 0;
        }

    .js-product-quantity-container {
        margin-right: 20px;
    }

    .js-addtocart.js-addtocart-placeholder.btn.btn-primary.btn-block.btn-transition.btn-vip.w-button.disabled {
        padding: 0;
        background: transparent;
        opacity: 1;
        min-height: 45px;
    }

    .d-inline-block.btnagregar.w-button {
        width: 100%;
        height: 100%;
        min-height: 45px;
        font-weight: 500;
    }

    .btn-vip {
        width: 50%;
    }

    .nostock, .nostock:hover {
        background: #ddd !important;
        opacity: 0.5 !important;
        cursor: not-allowed !important;
    }

    .js-product-variants-group.form-group.col-12.text-center.text-md-left.mb-4 {
        margin-bottom: 5px !important;
    }

    .form-quantity-product .js-quantity-input {
        color: #000 !important;
        font-weight: 600 !important;
        font-size: 15px;
    }

    span.js-quantity-up.form-quantity-icon.btn.icon-35px.font-small {
        font-size: 25px !important;
        line-height: 33px;
    }

    span.js-quantity-down.form-quantity-icon.btn.icon-35px.font-small {
        font-size: 25px !important;
        line-height: 33px;
    }

</style>

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
