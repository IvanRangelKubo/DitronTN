<div class="seccproductos">
  <div class="customcontainer">

    <div class="contitlecust">
      <h1 class="secctilte">{{ settings.carrousel_products_title }}</h1>
      <div class="linetitle"></div>
    </div>

    <div class="customhtml w-embed">
      <div class="owl-carousel productosowl owl-theme" id="sync2">

        {% if sections.carrousel.products %}
          {% for product in sections.carrousel.products %}
              {% include 'snipplets/grid/item.tpl' with { 'product': product } %}
          {% endfor %}
        {% endif %}

      </div>
    </div>

  </div>
</div>
