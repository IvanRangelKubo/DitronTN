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
</style>