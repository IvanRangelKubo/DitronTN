
<div class="seccgarantias">
  <div class="customcontainer">
    <div data-delay="3000" data-animation="cross" class="warrantyslide w-slider" data-autoplay="true" data-easing="ease-in-out" data-hide-arrows="false" data-disable-swipe="false" data-autoplay-limit="0" data-nav-spacing="3" data-duration="1500" data-infinite="true">
      
      <div class="maskwarranty w-slider-mask">

    
        {% if settings.banner_services_01_description or ("banner_services_01.jpg" | has_custom_image) %}
        <div class="garantiaslide w-slide">
          <div class="continfowarranty">
            <img 
              src="{{ 'banner_services_01.jpg' | static_url }}" 
              alt="{{ settings.banner_services_01_description | default('Garantía 1') }}"
              class="iconwarranty"
            >
            <p class="infowarranty">{{ settings.banner_services_01_description | raw }}</p>
          </div>
        </div>
        {% endif %}

   
        {% if settings.banner_services_02_description or ("banner_services_02.jpg" | has_custom_image) %}
        <div class="garantiaslide w-slide">
          <div class="continfowarranty">
            <img 
              src="{{ 'banner_services_02.jpg' | static_url }}" 
              alt="{{ settings.banner_services_02_description | default('Garantía 2') }}"
              class="iconwarranty"
            >
            <p class="infowarranty">{{ settings.banner_services_02_description | raw }}</p>
          </div>
        </div>
        {% endif %}

        {% if settings.banner_services_03_description or ("banner_services_03.jpg" | has_custom_image) %}
        <div class="garantiaslide w-slide">
          <div class="continfowarranty">
            <img 
              src="{{ 'banner_services_03.jpg' | static_url }}" 
              alt="{{ settings.banner_services_03_description | default('Garantía 3') }}"
              class="iconwarranty"
            >
            <p class="infowarranty">{{ settings.banner_services_03_description | raw }}</p>
          </div>
        </div>
        {% endif %}

      </div>

      <div class="garantiasarrow w-slider-arrow-left">
        <div class="w-icon-slider-left"></div>
      </div>
      <div class="garantiasarrow w-slider-arrow-right">
        <div class="w-icon-slider-right"></div>
      </div>

      <div class="warrantyslidenav w-slider-nav w-slider-nav-invert w-round"></div>

    </div>
  </div>
</div>

