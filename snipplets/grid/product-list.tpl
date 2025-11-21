 {% set noFilterResult = "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." %}

 {% if products %}

    <div class="js-product-table contitemslisting">
        {% include 'snipplets/product_grid.tpl' %}
    </div>

    {% include "snipplets/grid/pagination.tpl" with {infinite_scroll: false} %}

{% else %}    
    <div class="container-listing">
        <div class="customcontainer">
            <div class="not-found-div">
                <img loading="lazy" src="{{ "images/search_icon_1.svg" | static_url }}" alt="Not found icon" class="imgsearch">
                <h4 class="no-reults-txt">LO SENTIMOS<br>Ups… no encontramos productos que coincidan.</h4>
                <a href="{{ store.products_url }}" class="btnagregar w-button" style="width: fit-content;">Seguir comprando</a>
            </div>
        </div>
    </div>
{% endif %} 