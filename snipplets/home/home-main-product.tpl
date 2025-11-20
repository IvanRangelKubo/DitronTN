<div class="seccbaner2">
  <div class="customcontainer">
    <a href="{{ settings.informative_banner_link | default('#') }}" class="linksecondbanner w-inline-block">


      {% if "informative_banner.jpg" | has_custom_image %}
        <img 
          src="{{ "informative_banner.jpg" | static_url }}" 
          alt="{{ settings.informative_banner_desktop_alt }}"
          class="bannersecundario escritorio"
        >
      {% endif %}

      {% if "informative_banner_mobile.jpg" | has_custom_image %}
        <img 
          src="{{ "informative_banner_mobile.jpg" | static_url }}" 
          alt="{{ settings.informative_banner_mobile_alt }}"
          class="bannersecundario mobile"
        >
      {% else %}
        {% if "informative_banner.jpg" | has_custom_image %}
          <img 
            src="{{ "informative_banner.jpg" | static_url }}" 
            alt="{{ settings.informative_banner_desktop_alt }}"
            class="bannersecundario mobile"
          >
        {% endif %}
      {% endif %}

    </a>
  </div>
</div>
