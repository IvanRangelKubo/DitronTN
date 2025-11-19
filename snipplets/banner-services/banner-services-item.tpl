<div class="garantiaslide w-slide">
  <div class="continfowarranty">
    {% if banner_services_icon == 'image' and banner_services_image %}
      <img 
        src="{{ "#{banner}.jpg" | static_url }}" 
        alt="{{ banner_services_title }}" 
        class="iconwarranty"
      >
    {% else %}
      <img 
        src="{{ 'fallback_icon.svg' | static_url }}" 
        alt="{{ banner_services_title }}" 
        class="iconwarranty"
      >
    {% endif %}

    <p class="infowarranty">
      {% if banner_services_title %}<strong>{{ banner_services_title }}</strong>{% endif %}
      {% if banner_services_description %} {{ banner_services_description }}{% endif %}
    </p>
  </div>
</div>
