<div class="seccbaner2">
  <div class="customcontainer">
    <a href="{{ settings.secondary_banner_link | default('#') | setting_url }}" class="linksecondbanner w-inline-block">

      {% if "secondary_banner_desktop.jpg" | has_custom_image %}
        <img 
          src="{{ "secondary_banner_desktop.jpg" | static_url  }}" 
          alt="{{ settings.secondary_banner_desktop_alt }}" 
          class="bannersecundario escritorio"
        >
      {% endif %}

      {% if "secondary_banner_mobile.jpg" | has_custom_image %}
        <img 
          src="{{ "secondary_banner_mobile.jpg" | static_url  }}" 
          alt="{{ settings.secondary_banner_mobile_alt }}" 
          class="bannersecundario mobile"
        >
      {% endif %}

    </a>
  </div>
</div>
