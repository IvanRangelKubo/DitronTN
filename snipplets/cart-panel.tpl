<div class="js-ajax-cart-list cartItems">
    {# Cart panel items #}
    {% if cart.items %}
      {% for item in cart.items %}
        {% include "snipplets/cart-item-ajax.tpl" %}
      {% endfor %}
    {% endif %}
</div>

<div class="js-empty-ajax-cart" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
 	{# Cart panel empty #}
    <div class="alert alert-info text-center mt-0" data-component="cart.empty-message">{{ "El carrito de compras está vacío." | translate }} </div>
</div>

<div id="error-ajax-stock" style="display: none;">
	<div class="alert alert-warning m-3">
     	{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link font-small ml-1">{{ "ver otros acá" | translate }}</a>
    </div>
</div>

<div class="cart-row mt-4">
    {% include "snipplets/cart-totals.tpl" %}
</div>

<style>
.cartItems {
    height: 72vh;
    overflow-y: auto;
    overflow-x: hidden;
    scrollbar-gutter: stable both-edges;
}

img.img-fluid.cart-item-image {
    object-fit: contain;
}

.form-group.form-quantity.cart-item-quantity.small.p-0 {
    border: 1px solid black;
    border-radius: 9px;
}

span.js-cart-quantity-btn.form-quantity-icon.icon-35px.font-small {
    font-size: 20px !important;
}

svg.icon-inline.icon-spin.icon-w-2em.svg-icon-text {
    fill: #0099d4;
}
</style>

