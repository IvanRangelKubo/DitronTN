      <nav role="navigation" class="nav-menu w-nav-menu">

				{% set menu_key = settings.main_menu | default('navigation') %}
  			{% set menu_items = attribute(menus, menu_key) ?? navigation %}

				{% for item in menu_items %}
					{% if item.subitems %}

						<div data-delay="0" data-hover="true" class="dropnavmain w-dropdown">
							<div class="menuelement drop w-dropdown-toggle">
								<div class="arrowdropmenu w-icon-dropdown-toggle"></div>
								<div>{{ item.name }}</div>
							</div>
							<nav class="menucontdrop w-dropdown-list">
								{% for subitem in item.subitems %}
									<a href="{{ subitem.url }}" class="droplinkmenu w-dropdown-link">{{ subitem.name }}</a>
								{% endfor %}
							</nav>
						</div>
						
					{% else %}
						<a href="{{ item.url }}" class="menuelement w-nav-link">{{ item.name }}</a>
					{% endif %}
				{% endfor %}

        <a href="#" class="menuelement hiddendesk w-inline-block">
					<img src="{{ "images/icon_usuario.svg" | static_url }}" class="iconmenu">
          <div class="menuname">Mi cuenta</div>
        </a>

				{% if settings.show_off_link %}
					<a href="{{ settings.off_url }}" class="menuelement ofertas w-inline-block">
						<img src="{{ "images/ofertas_icon.svg" | static_url }}"  alt="" class="iconmenu">
						<div class="menuname">Ofertas</div>
					</a>				
				{% endif %}

				{% if settings.show_contact_link %}
					<a href="{{ settings.contact_url }}" class="menuelement contacto w-inline-block">
						<img src="{{ "images/contacto_icon.svg" | static_url }}"  alt="" class="iconmenu">
						<div class="menuname">Contacto</div>
					</a>
				{% endif %}

      </nav>