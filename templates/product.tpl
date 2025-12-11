<div id="single-product" class="containervip js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">

    <div class="customcontainer">

        {% include "snipplets/breadcrumbs.tpl" %}

        <div id="w-node-_4928596a-9fbc-925c-b50a-bad836de26a2-54e89ff7" class="w-layout-layout stackvip wf-layout-layout">

            <div class="w-layout-cell">
                {% include 'snipplets/product/product-image.tpl' %}
            </div>

            <div class="w-layout-cell" data-store="product-info-{{ product.id }}">
                {% include 'snipplets/product/product-form.tpl' %}
            </div>

        </div>

    </div>

    {# Related products #}
    {% include 'snipplets/product/product-related.tpl' %}

    <div class="customcontainer">
      <div class="contitlecust">
        <h3 id="barritascroll" class="secctilte">RESEÑAS DE CLIENTES</h3>
        <div class="linetitle"></div>
      </div>
    </div>

</div>

<style>
    .row.vipImg {
        width: 100%;
    }

    .product-detail-slider .product-slider-image {
        max-height: 600px;
    }

    .cont-variacion > .js-addtocart.js-addtocart-placeholder.btn.btn-primary.btn-block.btn-transition.btn-vip.w-button.disabled {
        width: 50% !important;
        margin: 0px !important;
    }

    .js-addtocart.js-addtocart-placeholder.btn-transition.disabled {
        margin: 10px auto !important;
    }

    .js-addtocart.js-addtocart-placeholder.btn-transition.disabled {
        width: 95% !important;
    }





    @media (min-width: 768px) and (max-width: 1024px) {
        .swiper-slide.thumb-slide {
            width: 22% !important;
        }
    }

    @media screen and (max-width: 767px) {
        .cont-variacion > .js-addtocart.js-addtocart-placeholder.btn.btn-primary.btn-block.btn-transition.btn-vip.w-button.disabled {
            width: 100% !important;
        }

        .js-addtocart.js-addtocart-placeholder.btn-transition.disabled {
            width: 100% !important;
        }
	}

    @media screen and (max-width: 479px) {
        a.categoria-arbol {
            width: max-content;
        }

        .js-product-variants-group.js-color-variants-container.form-group.col-12.text-center.text-md-left.mb-2 {
            display: flex;
            justify-content: flex-start;
        }

        .js-product-variants-group.form-group.col-12.text-center.text-md-left.mb-4 {
            display: flex;
            justify-content: flex-start;
        }

        input.js-addtocart.js-prod-submit-form.btn-add-to-cart.btn.btn-primary.btn-big.btn-block.btn-vip.w-button.cart {
            width: 100%;
        }

        .cont-variacion.qty {
            gap: 5px;
        }

        .product-thumbs-horizontal.mt-3 {
            display: none;
        }

        .col.px-3 {
            padding: 0 !important;
        }

        .row.vipImg {
            margin: auto !important;
        }
    }
</style>
