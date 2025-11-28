
{% set has_advertising_bar = false %}
{% set num_messages = 0 %}

{% for adbar in ['ad_bar_01', 'ad_bar_02', 'ad_bar_03'] %}
    {% set advertising_text = attribute(settings, "#{adbar}_text") %}
    {% if advertising_text %}
        {% set has_advertising_bar = true %}
        {% set num_messages = num_messages + 1 %}
    {% endif %}
{% endfor %}

{% if settings.ad_bar and has_advertising_bar %}
<div class="container-topbanner">
    <div 
        data-delay="3000" 
        data-animation="slide" 
        class="topbannerslider w-slider" 
        data-autoplay="true" 
        data-easing="ease" 
        data-hide-arrows="false" 
        data-disable-swipe="false" 
        data-autoplay-limit="0" 
        data-nav-spacing="3" 
        data-duration="500" 
        data-infinite="true"
    >
        <div class="w-slider-mask">

            {% for adbar in ['ad_bar_01', 'ad_bar_02', 'ad_bar_03'] %}
                {% set advertising_text = attribute(settings, "#{adbar}_text") %}
                {% set advertising_url = attribute(settings, "#{adbar}_url") %}

                {% if advertising_text %}
                <div class="topslide w-slide">
                    {% if advertising_url %}
                        <a href="{{ advertising_url }}" class="msg-topslide">
                            {{ advertising_text }}
                        </a>
                    {% else %}
                        <a class="msg-topslide">
                            {{ advertising_text }}
                        </a>
                    {% endif %}
                </div>
                {% endif %}
            {% endfor %}

        </div>

        {% if num_messages > 1 %}
        <div class="topbannerarrow w-slider-arrow-left">
            <div class="w-icon-slider-left"></div>
        </div>
        <div class="topbannerarrow w-slider-arrow-right">
            <div class="w-icon-slider-right"></div>
        </div>
        {% endif %}

        <div class="topslidenav w-slider-nav w-round"></div>
    </div>
</div>
{% endif %}

