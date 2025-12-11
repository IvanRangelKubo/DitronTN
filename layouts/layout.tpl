<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}" data-wf-page="68f67e0dee84f80c4ac40bd1" data-wf-site="68f67e0cee84f80c4ac40b86">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
        <link href="{{ "images/webclip.png" | static_url }}" rel="apple-touch-icon">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>

        <script type="text/javascript">WebFont.load({  google: {    families: ["Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic","Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic"]  }});</script>
        <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>

        {% set welcome_italic_font = settings.welcome_text and settings.welcome_italic %}
        {% set institutional_italic_font = settings.institutional_text and settings.institutional_italic %}
        {% set testimonial_italic_font = settings.testimonials_italic %}
        
        {% set italic_font = params.preview or (not params.preview and template == 'home' and welcome_italic_font or institutional_italic_font or testimonial_italic_font) %}
        {% set google_fonts_weights = italic_font ? '400,400italic,700' : '400,700' %}
        
        <link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url(google_fonts_weights) }}" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />

        {# Preload LCP home, category and product page elements #}
        
        {% snipplet 'preload-images.tpl' %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>
            {# Font families #}
            
            {{ component(
                'fonts',{
                    font_weights: google_fonts_weights,
                    font_settings: 'settings.font_headings, settings.font_rest'
                })
            }}

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}

        </style>

        <style type="text/css">
            ul.search-suggestions-list::-webkit-scrollbar {
                width: 8px;
                height: 6px;
            }

            ul.search-suggestions-list::-webkit-scrollbar-button {
                width: 0px;
                height: 0px;
            }

            ul.search-suggestions-list::-webkit-scrollbar-thumb {
                background: #000;
                border: 0px none #C6C6C6;
                border-radius: 0px;
            }

            ul.search-suggestions-list::-webkit-scrollbar-thumb:hover {
                background: #000;
            }

            ul.search-suggestions-list::-webkit-scrollbar-thumb:active {
                background: #000;
            }

            ul.search-suggestions-list::-webkit-scrollbar-track {
                background: #F8FAFD;
                border: 0px solid #F8FAFD;
                border-radius: 0px;
            }

            ul.search-suggestions-list::-webkit-scrollbar-track:hover {
                background: #F8FAFD;
            }

            ul.search-suggestions-list::-webkit-scrollbar-track:active {
                background: #F8FAFD;
            }

            ul.search-suggestions-list::-webkit-scrollbar-corner {
                background: transparent;
            }
        </style>

        <style>
            iframe#store_bar_iframe {
                visibility: hidden;
            }

            .imgfront:hover {
                opacity: 1 !important;
            }

            .hoverOn:hover {
                opacity: 0 !important;
            }

            .imgfront, .imgback {
                background-size: contain !important;
            }

            a.js-item-name.nombre-producto {
                height: 55px;
            }

            a.js-item-name.nombre-producto:hover {
                color: black;
            }

            .item-actions .alert {
                z-index: 15;
            }

        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        <link rel="stylesheet" href="{{ 'css/ditronStyles2.css' | static_url }}">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% template_content %}

        {# Quickshop modal #}

        {% snipplet "grid/quick-shop.tpl" %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

        {% if store.assorted_js %}
            <script>
                LS.ready.then(function() {
                    var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
                    jQueryNuvem('body').append(trackingCode);
                });
            </script>
        {% endif %}

        <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=68f67e0cee84f80c4ac40b86" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="{{ 'js/ditronJs.js' | static_url }}"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

        <script>
            $(document).ready(function(){
            $(".productosowl").owlCarousel({
                loop:true,
                margin:3,    
                navRewind: true,
                autoWidth:false,
                autoplay:false,
                slideSpeed: 4000,
                navText: ['<div class="sliderarrow w-slider-arrow-left"><div class="w-icon-slider-left"></div>','<div class="sliderarrow w-slider-arrow-right"><div class="w-icon-slider-right"></div></div>'],
                responsiveClass:true,
                responsive:{
                    0:{
                        items:2,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    480:{
                        items:2,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    767:{
                        items:3,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    991:{
                        items:4,
                        nav:true,
                        dots:false
                    }
                }
            });
            });  
        </script>
        <script>
            $(document).ready(function(){
            $(".categoriasowl").owlCarousel({
                loop:true,
                margin:3,    
                navRewind: true,
                autoWidth:false,
                autoplay:false,
                slideSpeed: 4000,
                navText: ['<div class="sliderarrow w-slider-arrow-left"><div class="w-icon-slider-left"></div>','<div class="sliderarrow w-slider-arrow-right"><div class="w-icon-slider-right"></div></div>'],
                responsiveClass:true,
                responsive:{
                    0:{
                        items:2,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    480:{
                        items:2,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    767:{
                        items:3,
                        nav:true,
                        dots:false,
                        mouseDrag: true,
                        touchDrag: true
                    },
                    991:{
                        items:5,
                        nav:true,
                        dots:false
                    }
                }
            });
            });  
        </script>

        <style>
            form.js-ajax-cart-panel {
                padding: 5px 10px;
            }

            .js-modal-close.js-fullscreen-modal-close.modal-header {
                padding: 10px 0px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: transparent;
            }

            .row.no-gutters.align-items-center {
                width: 100%;
            }

            .col.pr-3.pl-5 {
                padding: 0px !important;
                text-align: start;
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
                font-size: 20px;
                font-weight: 600;
                color: var(--ditron-blue);
            }

            svg.icon-inline.svg-icon-text {
                width: 1.2em !important;
                height: 1.2em !important;
            }

            .js-ajax-cart-submit.mb-2 > input.btnagregar.w-button {
                margin: 0;
                width: 100%;
            }

            .modal-body.h-100 {
                padding: 5px 10px;
            }

            form.js-ajax-cart-panel > .modal-body.h-100 >  .cart-row.mt-4 {
                border-top: 1px solid gainsboro !important;
                padding-top: 15px !important;
            }

            form.js-ajax-cart-panel > .modal-body.h-100 >  .cart-row.mt-4 {
                border-top: 1px solid gainsboro !important;
                padding-top: 15px !important;
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
            }

            .cart-row.mt-4 > * {
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
                font-size: large !important;
            }

            .js-cart-total-container.js-visible-on-cart-filled > .h2.row.font-huge.mb-2 > *
            {
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
            }

            .js-visible-on-cart-filled.h5.font-big.row.mb-2 > span.col-7 {
                font-size: 20px !important;
            }

            .js-cart-total-container > .h2.row.font-huge.mb-2 > span.col-auto {
            font-size: 20px !important;
            }

            span.js-cart-total.col.text-right {
                font-size: large;
            }

            .js-cart-item.js-cart-item-shippable.cart-item.row.no-gutters.mb-3 {
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
            }

            span.btn-link.font-small {
                color: var(--ditron-blue);
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
            }

            a.d-block.d-sm-inline.mr-3.mr-sm-2 {
                font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
                color: black;
            }

            section.section-featured-home,.section-banners-home, .section-modules-home {
                padding: 0px !important;
            }

            .js-cart-item.js-cart-item-shippable.cart-item.row.no-gutters.mb-3 {
                font-size: medium;
            }

            .font-small.mb-1 {
                font-size: medium !important;
            }

            .text-accent, .product-installments.installment-no-interest {
                color: #0099d4 !important;
            }

            a.btnagregar.w-button:hover {
                color: white;
            }

            .alert, .alert-success {
                display: flex;
                flex-direction: row;
                justify-content: center;
            }

            .js-addtocart.js-addtocart-placeholder.btn-transition.disabled {
                width: 100%;
                margin: 0px auto;
            }

            .btnagregar {
                height: 45px;
            }

            a.btnagregar:hover, a.btnagregar:focus {
                color: white;
            }

            a.kdlink:focus{
                color: var(--ditron-blue);
            }

            .modal-overlay {
                z-index: 10001;
            }

            .alert {
                line-height: 1.2;     
            }

            .alert:before {
            content: "";
            display: inline-block;
            width: 12px;
            height: 12px;
            margin: 0 6px 0 0;
            vertical-align: top; 
            }

            .alert:before {
            position: relative;
            top: 2px; 
            }

        </style>

    </body>
</html>
