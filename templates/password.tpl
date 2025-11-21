<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />

        {% set italic_font = params.preview %}
        {% set google_fonts_weights = italic_font ? '400,400italic,700' : '400,700' %}

        <link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url(google_fonts_weights) }}" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />
        
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

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">
        <link rel="stylesheet" href="{{ 'css/ditronStyles.css' | static_url }}">

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

        {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {# Loads private Tienda Nube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="body-password {% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Theme icons #}


        {# Page content #}


        <div class="mttocont">
        <div class="w-layout-layout stackmtto wf-layout-layout">
            
            <div class="w-layout-cell celllogo"></div>

            <div class="w-layout-cell">

            {# LOGO #}
            <img 
                src="{{ 'images/logo_micuenta.png' | static_url }}"
                alt="Ditron Mexico"
                loading="lazy"
                class="logomtto"
            >

            <h1 class="titlemtto">Estamos preparando algo increíble para ti</h1>
            <p class="txtmtto">Por favor, inténtalo nuevamente en unos minutos para descubrir todas las novedades.</p>

            {# ICONO PARA MOSTRAR FORM (si manejas animación en Webflow) #}
            <div id="Lock">
                <img 
                loading="lazy" 
                src="{{ 'images/password_icon.svg' | static_url }}"
                alt="Icono de mantenimiento"
                class="iconformmtto"
                >
            </div>

            <div class="div-block" id="Pass">
                <div class="formloginstore w-form">

                {# FORMULARIO NATIVO DE TIENDANUBE #}
                {% embed "snipplets/forms/form.tpl" 
                    with{
                    form_id: 'password-form',
                    submit_text: 'Login' | translate,
                    form_custom_class: 'contlogform',
                    submit_custom_class: 'logiintienda w-button'
                    } 
                %}
                    {% block form_body %}

                    {# INPUT DE CONTRASEÑA #}
                    {% embed "snipplets/forms/form-input.tpl"
                        with{
                        input_for: 'password',
                        type_password: true,
                        input_name: 'password',
                        input_custom_class: 'passtienda w-input'
                        }
                    %}
                        {% block input_form_alert %}
                        {% if invalid_password == true %}
                            <div class="msgform">Password incorrecto</div>
                        {% endif %}
                        {% endblock input_form_alert %}
                    {% endembed %}

                    {% endblock %}
                {% endembed %}

                </div>
            </div>

            </div>
        </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const lock = document.getElementById("Lock");
                const pass = document.getElementById("Pass");
                pass.style.display = "none";

                lock.addEventListener("click", function () {
                pass.style.display = pass.style.display === "none" ? "block" : "none";
                });
            });
        </script>

        <style>
            .mt-4.text-center {
                display: none;
            }

            a.js-password-view.btn.form-toggle-eye {
                display: none;
            }

            .form-group {
                margin: 0;
            }

            input.btn.btn-primary.logiintienda.w-button {
                text-transform: none;
                letter-spacing: 0;
            }

            .formloginstore {
                display: block;
            }

            .mttocont {
                background-position: inherit;
            }
        </style>



        {# Javascript needed to footer logos lazyload #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            LS.ready.then(function(){
                jQueryNuvem('.js-password-view').on("click", function (e) {
                    jQueryNuvem(e.currentTarget).toggleClass('password-view');

                    if(jQueryNuvem(e.currentTarget).hasClass('password-view')){
                        jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', '');
                        jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
                    } else {
                        jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', 'password');
                        jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
                    }
                });
            });

        </script>

        {# Google survey JS for Tienda Nube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

    </body>
</html>
