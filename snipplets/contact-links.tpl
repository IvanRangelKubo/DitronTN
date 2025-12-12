<ul class="list {% if footer %}font-small py-2{% else %}mb-4{% endif %}">
	{% if settings.show_whatsApp %}
		<li class="{% if footer %}d-block {% endif %}mb-3">
			<a href="{{ settings.whatsapp_link }}" target="_blank" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					<svg class="icon-inline mr-2 font-body whats"><use xlink:href="#whatsapp"/></svg>
				{% endif %}
				{{ settings.whatsapp_link |trim('https://wa.me/') }}
			</a>
		</li>
	{% endif %}
	{% if store.phone %}
		<li class="{% if footer %}d-block {% endif %}mb-3">
			<a href="tel:{{ store.phone }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					<svg class="icon-inline mr-2 font-body"><use xlink:href="#phone"/></svg>
				{% endif %}
				{{ store.phone }}
			</a>
		</li>
	{% endif %}
	{% if store.email %}
		<li class="{% if footer %}d-block {% endif %}mb-3">
			<a href="mailto:{{ store.email }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					<svg class="icon-inline mr-2 font-body"><use xlink:href="#email"/></svg>
				{% endif %}
				{{ store.email }}
			</a>
		</li>
	{% endif %}
	{% if not phone_and_mail_only %}
		{% if store.address and not is_order_cancellation %}
			<li class="{% if footer %}d-block {% endif %}mb-3">
				{% if with_icons %}
					<svg class="icon-inline mr-2 font-body"><use xlink:href="#map-marker-alt"/></svg>
				{% endif %}
				{{ store.address }}
			</li>
		{% endif %}
		{% if store.blog %}
			<li class="{% if footer %}d-block {% endif %}mb-3">
				<a target="_blank" href="{{ store.blog }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
					{% if with_icons %}
						<svg class="icon-inline icon-w-2em mr-2 font-body"><use xlink:href="#comments"/></svg>
					{% endif %}
					{{ "¡Visitá nuestro Blog!" | translate }}
				</a>
			</li>
		{% endif %}
	{% endif %}
</ul>

<style>
	ul.list.mb-4 {
		font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
	}

	ul.list.mb-4 {
		font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
		display: flex;
		justify-content: center;
		align-items: flex-start;
		flex-direction: column;
		margin-top: 20px;
	}

	svg.icon-inline.mr-2.font-body {
		fill: var(--ditron-blue);
		height: 25px;
		width: 25px;
		transform: rotateY(180deg);
	}

	svg.icon-inline.mr-2.font-body.whats {
		transform: rotateY(0deg);
	}

	a.contact-link {
		display: flex;
		align-items: center;
		gap: 5px;
		
	}
</style>