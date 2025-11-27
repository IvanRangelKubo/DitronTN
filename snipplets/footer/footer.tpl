  <div class="customfooter">

    <div class="customcontainer">
      <div id="w-node-_4e8f93f5-21ff-c475-b9c3-976ddd6d2c2d-dd6d2c2b" class="w-layout-layout footerstack wf-layout-layout">

        <div id="w-node-_4e8f93f5-21ff-c475-b9c3-976ddd6d2c2e-dd6d2c2b" class="w-layout-cell footercell">
          <a href="{{ store.url }}" class="linkfooterlogo w-inline-block">
						<img src="{{ "footer_logo.jpg" | static_url }}"  alt="{{ settings.footer_logo_alt }}" class="logofooter">
					</a>
        </div>

        <div class="w-layout-cell footercell">
          <div data-w-id="4e8f93f5-21ff-c475-b9c3-976ddd6d2c32" class="contitlecust">
            <h5 class="footertitle icondown">{{ settings.footer_menu_title }}</h5>
            <div class="linetitle small"></div>
          </div>

          <div class="cont-items-footer">
						{% for item in menus[settings.footer_menu] %}
							<div class="itemfooter">
								<a href="{{ item.url }}" {% if item.url | is_external %} target="_blank" {% endif %} class="footerlink">{{ item.name }}</a>
							</div>
						{% endfor %}
          </div>

        </div>

        <div class="w-layout-cell footercell">

					{% if settings.contact_phone is not empty or settings.contact_email is not empty %}

						<div class="contitlecust">
							<h5 data-w-id="4e8f93f5-21ff-c475-b9c3-976ddd6d2c51" class="footertitle">CONTACTO</h5>
							<div class="linetitle small"></div>
						</div>

						<div class="cont-items-footer regular">

							{% if settings.contact_phone is not empty %}
								<div class="itemfooter">
									<img src="{{ "images/phone_icon.svg" | static_url }}" alt="phone icon" class="iconfootercust">
									<a href="tel:{{ settings.contact_phone }}" class="footerlink">{{ settings.contact_phone }}</a>
								</div>
							{% endif %}

							{% if settings.contact_email is not empty %}
								<div class="itemfooter">
									<img src="{{ "images/mail_icon.svg" | static_url }}" alt="email icon" class="iconfootercust">
									<a href="mailto:{{ settings.contact_email }}" class="footerlink">{{ settings.contact_email }}</a>
								</div>
							{% endif %}

						</div>

					{% endif %}


					{% if settings.facebook_link is not empty 
						or settings.instagram_link is not empty 
						or settings.yt_link is not empty %}

						<div class="contitlecust">
							<h6 class="footertitle">SÍGUENOS EN</h6>
							<div class="linetitle small"></div>
						</div>

						<div class="cont-items-footer regular">
							<div class="itemfooter">

								{% if settings.facebook_link is not empty %}
									<a href="{{ settings.facebook_link }}" class="sociallinkf w-inline-block" target="_blank" rel="noopener">
										<img src="{{ "images/fb_icon.svg" | static_url }}" alt="Facebook" class="iconfootercust">
									</a>
								{% endif %}

								{% if settings.instagram_link is not empty %}
									<a href="{{ settings.instagram_link }}" class="sociallinkf w-inline-block" target="_blank" rel="noopener">
										<img src="{{ "images/ig_icon.svg" | static_url }}" alt="Instagram" class="iconfootercust">
									</a>
								{% endif %}

								{% if settings.yt_link is not empty %}
									<a href="{{ settings.yt_link }}" class="sociallinkf w-inline-block" target="_blank" rel="noopener">
										<img src="{{ "images/yt_icon.svg" | static_url }}" alt="Youtube" class="iconfootercust">
									</a>
								{% endif %}

							</div>
						</div>

					{% endif %}


        </div>

				{% include "snipplets/newsletter.tpl" %}

      </div>
    </div>

    <div class="customcontainer">
      <div id="w-node-_4e8f93f5-21ff-c475-b9c3-976ddd6d2c7d-dd6d2c2b" class="w-layout-layout stackcopyr wf-layout-layout">

        <div id="w-node-_4e8f93f5-21ff-c475-b9c3-976ddd6d2c7e-dd6d2c2b" class="w-layout-cell cell">
          <div class="copytxt" id="copy">© DITRON Home and Living<br>Todos los derechos reservados - Designed and Developed by <a href="https://www.kubodigital.mx" target="_blank" class="kdlink">Kubo Digital</a></div>
					<div style=" display: flex; flex-direction: row; justify-content: center; color: white;">{{ new_powered_by_link }}</div>
        </div>

				<div class="w-layout-cell">
					<div class="contlogospagos">

						<img 
							src="{{ "pago_1.jpg" | static_url }}" 
							alt="{{ settings.pago_1_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_2.jpg" | static_url }}" 
							alt="{{ settings.pago_2_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_3.jpg" | static_url }}" 
							alt="{{ settings.pago_3_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_4.jpg" | static_url }}" 
							alt="{{ settings.pago_4_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_5.jpg" | static_url }}" 
							alt="{{ settings.pago_5_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_6.jpg" | static_url }}" 
							alt="{{ settings.pago_6_alt }}" 
							class="mediopago"
						>

						<img 
							src="{{ "pago_7.jpg" | static_url }}" 
							alt="{{ settings.pago_7_alt }}" 
							class="mediopago"
						>

					</div>
				</div>


      </div>
    </div>

  </div>


<script>
	window.addEventListener('load', () => {
		const copy = document.getElementById('copy');
		const copyIndex = copy.innerHTML.indexOf('©');
		const date = new Date();
		const year = date.getFullYear();

		if (copyIndex !== -1) {
		const content = ` ${year}`
		copy.innerHTML = copy.innerHTML.replace('©', '©' + content);
		}
	})
</script>

<style>

  svg#svg_brand {
      fill: white;
  }

	.alert,
	.w-form-done,
	.w-form-fail {
			border-radius: 12px;
			padding: 14px 18px;
			margin-top: 12px;
			font-size: 14px;
			line-height: 1.35;
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
	}

	.alert-success,
	.w-form-done {
			background: #e8f8ee;
			color: #217a3c;
			border: 1px solid #b6e8c7;
	}

	.alert-danger,
	.w-form-fail {
			background: #fdecec;
			color: #b73838;
			border: 1px solid #f3b4b4;
	}


</style>