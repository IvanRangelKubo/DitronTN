{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{# Header #}

{# Slider and video presence #}

{% if template == 'home' %}
    {% set has_main_slider = settings.slider and settings.slider is not empty %}
    {% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
    {% set has_slider = has_main_slider or has_mobile_slider %}
    {% set has_slider_above_the_fold = settings.home_order_position_1 == 'slider' and has_slider %}
    {% set has_video_above_the_fold = settings.home_order_position_1 == 'video' and settings.video_embed %}
    {% set is_video_or_slider_above_the_fold = has_slider_above_the_fold or has_video_above_the_fold %}
{% endif %}

<header class="js-head-main" data-store="head">
  <div data-w-id="19bfc965-78d2-2790-076e-c7279723f3c1" data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="customnavbar w-nav">

    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}

    <div class="customcontainer navbar">

        <div class="burgermenu w-nav-button">
            <div class="w-icon-nav-menu"></div>
        </div>

        {% snipplet "header/header-logo.tpl" %}

    </div>
    
  </div>
</header>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add to cart notification for non fixed header #}

{% if settings.ajax_cart and not settings.head_fix_desktop %}
    <div class="{{ show_block_desktop_hide_mobile_class }}">
        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
    </div>
{% endif %}


{# Cross selling promotion notification on add to cart #}

{% embed "snipplets/modal.tpl" with {
    modal_id: 'js-cross-selling-modal',
    modal_class: 'bottom modal-bottom-sheet h-auto overflow-none modal-body-scrollable-auto',
    modal_header: true,
    modal_header_class: 'p-2 m-2 w-100',
    modal_position: 'bottom',
    modal_transition: 'slide',
    modal_footer: true,
    modal_width: 'centered-md m-0 p-0 modal-full-width modal-md-width-400px',
    modal_close_class: 'mr-4'
} %}
    {% block modal_head %}
        {{ '¡Descuento exclusivo!' | translate }}
    {% endblock %}

    {% block modal_body %}
        {# Promotion info and actions #}

        <div class="js-cross-selling-modal-body" style="display: none"></div>
    {% endblock %}
{% endembed %}

{% include "snipplets/header/header-modals.tpl" %}
