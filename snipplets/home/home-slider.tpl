{% set slider = settings.slider %}
{% set sliderMobile = settings.slider_mobile %}


<div class="seccslider">
  <div data-delay="4000" data-animation="cross" class="featuredslider w-slider" data-autoplay="false" data-easing="ease" data-hide-arrows="false" data-disable-swipe="false" data-autoplay-limit="0" data-nav-spacing="3" data-duration="500" data-infinite="true">
    <div class="w-slider-mask">

      {% for image in slider %}
        <div class="mainslide w-slide">
          <a href="{{ image.link }}" class="linkslider w-inline-block">
            <img src="{{ image.image | static_url }}"  alt="{{ image.title }}" class="bannerslide escritorio">
          </a>
        </div>
      {% endfor %}

    </div>

    <div class="sliderarrow w-slider-arrow-left">
      <div class="w-icon-slider-left"></div>
    </div>
    <div class="sliderarrow w-slider-arrow-right">
      <div class="w-icon-slider-right"></div>
    </div>
    <div class="maindotsnav w-slider-nav w-round"></div>
    
  </div>
</div>