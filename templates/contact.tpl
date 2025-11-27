
{% set is_order_cancellation_without_id = params.order_cancellation_without_id == 'true' %}
<section class="contact-page">

  <div class="seccmayoristaform">
    <div class="customcontainer">

      <div class="loginform contacto w-form">

				{% embed "snipplets/forms/form.tpl" with{form_id: 'contact-form', form_custom_class: 'js-winnie-pooh-form contenidoformlog', submit_custom_class: 'btn-vip w-button', form_action: '/winnie-pooh', submit_name: 'contact', submit_text: 'Enviar mensaje' | translate, data_store: 'contact-form' } %}
					{% block form_body %}

						<div class="winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>
						<input type="hidden" value="{{ product.id }}" name="product"/>
						<input type="hidden" name="type" value="contact" />
						<input type="hidden" name="message"/>

						<img src="{{ "images/title-form-mayoreo.svg" | static_url }}" loading="lazy" alt="" class="titlemayoreo">
						<p class="txtlogin center">Si requieres saber más sobre nuestros productos o recibir una cotización personalizada escríbenos a través del siguiente formulario.</p>

						<div id="w-node-c0f0ae24-2fbc-4bd1-3abc-bfa4107c8d03-0326c62c" class="w-layout-layout stackdirecciones wf-layout-layout">

						  <div class="w-layout-cell">
								<div class="loginlabel">Nombre Completo*</div>
								{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field w-input', input_placeholder: '', input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_required: true } %}
								{% endembed %}
            	</div>

						  <div class="w-layout-cell">
								<div class="loginlabel">Correo electrónico*</div>
								{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field w-input', input_placeholder: '',  input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_required: true } %}
								{% endembed %}
            	</div>

						</div>

						<div id="w-node-ddb0f8a6-5e75-268a-b9dd-4a96a908543e-0326c62c" class="w-layout-layout stackdirecciones wf-layout-layout">
							<div class="w-layout-cell">
								<div class="loginlabel">Teléfono*</div>
								{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field w-input', input_placeholder: '',  input_for: 'phone', type_tel: true, input_name: 'phone', input_id: 'phone', input_required: true } %}
								{% endembed %}
							</div>
							<div class="w-layout-cell">
								<div class="loginlabel">Empresa / negocio</div>
								{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field w-input', input_placeholder: '',  input_for: 'company', type_text: true, input_name: 'company', input_id: 'company' } %}
								{% endembed %}
							</div>
						</div>

						<div id="w-node-_892fa459-19f8-a20f-5dec-766c66172b39-0326c62c" class="w-layout-layout stackdirecciones wf-layout-layout">

							<div class="w-layout-cell">

								<div class="loginlabel">¿En qué producto estás interesado?</div>
								{% embed "snipplets/forms/form-select.tpl" with{select_for: 'help',select_custom_class: 'loginreg-field w-select', select_name: 'help', select_id: 'help' } %}
									{% block select_options %}
										<option value="">Selecciona una categoría</option>
										<option value="muebles">Muebles</option>
										<option value="Electrodomésticos">Electrodomésticos</option>
										<option value="Jardín">Jardín y aire libre</option>
										<option value="baño">Baños</option>
										<option value="herramientas">Herramientas</option>
										<option value="Otros">Otros</option>
									{% endblock select_options %}
								{% endembed %}
								
							</div>

							<div class="w-layout-cell">
								<div class="loginlabel">Ciudad / Estado</div>
								{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field w-input', input_placeholder: '',  input_for: 'city', type_tel: true, input_name: 'city', input_id: 'city' } %}
								{% endembed %}
							</div>

						</div>


						<div class="loginlabel">Si lo prefieres puedes enviar un mensaje</div>
						{% embed "snipplets/forms/form-input.tpl" with{input_custom_class: 'loginreg-field txtarea w-input', input_placeholder: 'Escribe aquí tu mensaje', text_area: true, input_for: 'custom_message', input_name: 'custom_message', input_id: 'custom_message', input_rows: '7' } %}
						{% endembed %}

          	<p class="txtlogin">Los campos marcados (*) son obligatorios</p>

						<label class="w-checkbox accept-tyc">
							<div class="w-checkbox-input w-checkbox-input--inputType-custom termscheckbopx"></div>
							<input type="checkbox" name="checkbox-2" id="checkbox-2" data-name="Checkbox 2" required="" style="opacity:0;position:absolute;z-index:-1" oninvalid="this.setCustomValidity('Marque esta casilla si desea continuar')" oninput="this.setCustomValidity('')">
							<span class="labelcheck-tyc-2 w-form-label" for="checkbox-2">
								<a href="#" class="tycregister-labellink">Acepto Aviso de Privacidad</a>
							</span>
						</label>

					{% endblock %}
				{% endembed %}

      </div>

			<!-- Notificaciones de usuario -->
			{% if contact %}
				{% if contact.success %}
						<div class="alert alert-success" data-component="contact-success-message">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
				{% else %}
					<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
				{% endif %}
			{% endif %}
			<!-- Notificaciones de usuario -->

    </div>
  </div>

	<script>
		document.addEventListener('DOMContentLoaded', function () {
			const form = document.querySelector('#contact-form');

			const helpInput = document.querySelector('[name="help"]');
			const companyInput = document.querySelector('[name="company"]');
			const cityInput = document.querySelector('[name="city"]');
			const customMessageInput = document.querySelector('[name="custom_message"]');
			const messageInput = document.querySelector('[name="message"]');

			if (form && messageInput) {
				form.addEventListener('submit', function () {
					const fields = [
						{ label: 'Empresa', input: companyInput },
						{ label: 'Interés', input: helpInput },
						{ label: 'Ciudad', input: cityInput },
						{ label: 'Mensaje', input: customMessageInput }
					];

					const message = fields
						.filter(f => f.input && f.input.value.trim() !== '')
						.map(f => `${f.label}: ${f.input.value.trim()}`)
						.join('\n');

					messageInput.value = message;
				});
			}
		});
	</script>


	<style>
		.form-group {
				margin: 0px;
		}

		.form-group .form-select-icon {
			display: none;
		}

		select.form-select.loginreg-field.w-select {
				appearance: auto !important;
		}

		input.btn.btn-primary.loginpopbtn.w-button {
				letter-spacing: normal;
				text-transform: none;
		}

		.alert.alert-success {
				margin-top: 25px;
		}

		.contenidoformlog {
				padding: 0px;
		}

		.stackcontacto {
				height: auto;
		}

		.g-recaptcha>div {
    	margin: 20px 0;
		}

		.termscheckbopx.w--redirected-checked {
				border-color: black;
				background-color: #0099d4;
		}

		span.js-form-spinner {
    position: absolute;
	}

		button:has(.js-form-spinner[style*="display: block"]) {
			color: transparent !important;
		}


	</style>

</section>