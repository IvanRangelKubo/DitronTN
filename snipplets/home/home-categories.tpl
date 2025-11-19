<div class="secccategorias">
  <div class="customcontainer">

    <div class="contitlecust">
      <h2 class="secctilte">
        {{ settings.main_categories_title | default("Categorías destacadas") }}
      </h2>
      <div class="linetitle"></div>
    </div>

    <div class="customhtml w-embed">
      <div class="owl-carousel categoriasowl owl-theme" id="sync2">

        {% for i in 1..14 %}
          {% set img = "category_" ~ i ~ ".jpg" %}
          {% if img | has_custom_image %}

            {% set title = attribute(settings, "cat_" ~ i ~ "_title") %}
            {% set url   = attribute(settings, "cat_" ~ i ~ "_url") %}

            <a href="{{ url }}" class="elementcate w-inline-block">
              <img 
                src="{{ img | static_url }}" 
                alt="{{ title }}"
                class="cateicon"
              >
              <p class="slidecatename">{{ title }}</p>
            </a>

          {% endif %}
        {% endfor %}

      </div>
    </div>

  </div>
</div>
