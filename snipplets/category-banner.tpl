{% set image_sizes = ['large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set has_category_images = category.images is not empty %}

{% for size in image_sizes %}
    {% if has_category_images %}
        {# Define images for admin categories #}
        {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
    {% else %}
        {# Define images for general banner #}
        {% set category_images = category_images|merge({(size):('banner_listing.jpg' | static_url | settings_image_url(size))}) %}
    {% endif %}
{% endfor %}

{% set category_image_url = 'banner_listing.jpg' | static_url %}

  <div class="headerlisting" style="background-image: linear-gradient(90deg, #dddad1 49%, #ffffff38 68%), url('{{ category_images["1080p"] }}');" >
    <div class="customcontainer">
        <div class="infoheaderlisting">
            {% include "snipplets/breadcrumbs.tpl" %}

            <div class="contitlecust">
                <h1 class="secctilte listing">{{ category.name }}</h1>
                <div class="linetitle"></div>
            </div>
        </div>
    </div>
  </div>

  <style>
    .headerlisting {
        
        background-position: 0 0, 50%;
        background-repeat: repeat, no-repeat;
        background-size: cover;
        padding-top: 30px;
        padding-bottom: 30px;
    }
  </style>