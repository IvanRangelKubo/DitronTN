{% if use_menu %}
	<div class="burgermenu w-nav-button">
			<div class="w-icon-nav-menu"></div>
	</div>
{% elseif use_account %}
	<span class="utilities-container {% if header_desktop %}d-none d-md-inline-block mr-4{% endif %}">
		{% if icon_only %}
			<a href="{% if not customer %}{{ store.customer_register_url }}{% else %}{{ store.customer_home_url }}{% endif %}" class="linkicons-nav mobile w-inline-block">
				<img loading="eager" src="{{ "images/icon_usuario.svg" | static_url }}" alt="Cuenta de usuario" class="icononav">
			</a>
		{% else %}
			<div class="row no-gutters align-items-center font-small">
				<div class="col-auto pr-0">
					<svg class="icon-inline font-big mr-1"><use xlink:href="#user"/></svg>
				</div>
				<div class="col pl-2 text-left">
					{% if not customer %}
						{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'mr-1') }} 
						{% if 'mandatory' not in store.customer_accounts %}
						.
						{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'ml-1') }}
						{% endif %}
					{% else %}
						{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
						{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', 'mr-1') }}
						.
						{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'ml-1') }}
					{% endif %}				
				</div>
			</div>
		{% endif %}
	</span>
{% elseif use_languages %}
	<span class="utilities-container nav-dropdown btn-utility position-relative py-0">
		<svg class="icon-inline utilities-icon"><use xlink:href="#globe"/></svg>
		<div class="nav-dropdown-content desktop-dropdown-small position-absolute">
			{% include "snipplets/navigation/navigation-lang.tpl" with { header: true } %}
		</div>
	</span>
{% elseif use_search %}
		<div class="js-search-button js-modal-open js-fullscreen-modal-open linkicons-nav buscadormobile" data-modal-url="modal-fullscreen-search" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
			<img data-w-id="19bfc965-78d2-2790-076e-c7279723f40d" loading="eager" alt="Search" src="{{ "images/search_icon_1.svg" | static_url }}" class="icononav">
		</div>
{% else %}

	<div class="linkicons-nav">
		<a 
			{% if settings.ajax_cart and template != 'cart' %}
				href="#"
				data-toggle="#modal-cart" 
				data-modal-url="modal-fullscreen-cart"
			{% else %}
				href="{{ store.cart_url }}"
			{% endif %}
			class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %}"
		>
			<img src="{{ "images/cart_icon.svg" | static_url }}" alt="Carrito" class="icononav">

		{% if cart.items_count > 0 %}
			<div class="qtynumber js-cart-widget-amount">{{ cart.items_count }}</div>
		{% endif %}

		</a>
	</div>

{% endif %}