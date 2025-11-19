{% if featured_products and sections.primary.products %}
<div class="seccproductos">
  <div class="customcontainer">

    <div class="contitlecust">
      <h1 class="secctilte">{{ settings.featured_products_title }}</h1>
      <div class="linetitle"></div>
    </div>

    <div class="customhtml w-embed">
      <div class="owl-carousel productosowl owl-theme" id="sync2">
 
          {% for product in sections.primary.products %}
            
            <div class="container-producto">
              {% include 'snipplets/grid/item.tpl' %}
            </div>

          {% endfor %}

      </div>
    </div>

  </div>
</div>
{% endif %}
