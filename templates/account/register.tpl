{# Account validation #}
{% if account_validation == 'pending' %}

	<section class="seccmicuenta">
		<div class="customcontainer">

			<div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-990be0eb" class="w-layout-layout stackcuenta wf-layout-layout">

        <div class="w-layout-cell centermiddlecell">
					<img src="{{ "images/logo_micuenta.png" | static_url}}" class="logologin">
				</div>

				<div class="w-layout-cell centermiddlecell">

					<div class="contitlecust">
						<h1 class="secctilte">CREAR CUENTA</h1>
						<div class="linetitle"></div>
					</div>
					
					<p class="txtlogin">{{ "Te enviamos un link a <strong>{1}</strong> para que valides tu email." | t(customer_email) }} </p>

					<div class="font-small mb-4">
						<p class="txtlogin center" >{{ "¿Todavía no lo recibiste?" | translate }} <span class="js-resend-validation-link destacadoblue">{{ "Enviar link de nuevo" | translate }}</span></p>
					</div>
					<div class="js-resend-validation-success alert alert-success" style="display:none">
						<p class="txtlogin center">{{ "¡El link fue enviado correctamente!" | translate }}</p>
					</div>
					<div class="js-resend-validation-error alert alert-danger" style="display:none">
						<p class="txtlogin center">{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
					</div>

				</div>


			</div>

		</div>
	</section>

{% else %}
	<div class="seccmicuenta">
    <div class="customcontainer">

      <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-990be0eb" class="w-layout-layout stackcuenta wf-layout-layout">

        <div class="w-layout-cell centermiddlecell">
					<img src="{{ "images/logo_micuenta.png" | static_url}}" class="logologin">
				</div>

        <div class="w-layout-cell centermiddlecell">
          <div class="loginform w-form">

							{% embed "snipplets/forms/form.tpl" with{form_id: 'login-form', form_custom_class: 'contenidoformlog', submit_custom_class: 'js-recaptcha-button btn-vip w-button', submit_prop: 'disabled', submit_text: 'Crear cuenta' | translate, data_store: 'account-register' } %}
								{% block form_body %}

									<div class="contitlecust">
										<h1 class="secctilte">CREAR CUENTA</h1>
										<div class="linetitle"></div>
									</div>

              		<p class="txtlogin">Regístrate en Ditron México, compra más fácil y disfruta de diferentes beneficios.</p>

									{# Name input #}
									<div class="loginlabel">Nombre Completo*</div>
									{% embed "snipplets/forms/form-input.tpl" with{type_text: true,input_custom_class: 'loginreg-field w-input', input_for: 'name', input_value: result.name, input_name: 'name', input_id: 'name', input_placeholder: '', input_required: true} %}
										{% block input_form_alert %}
											{% if result.errors.name %}
																<div class="alert alert-danger">{{ 'Usamos tu nombre para identificar tus pedidos.' | translate }}</div>
														{% endif %}
										{% endblock input_form_alert %}
									{% endembed %}

									{# Email input #}
									<div class="loginlabel">Correo electrónico*</div>
									{% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_custom_class: 'loginreg-field w-input', input_for: 'email', input_value: result.email, input_name: 'email', input_id: 'email', input_placeholder: '', input_required: true} %}
										{% block input_form_alert %}
											{% if result.errors.email == 'exists' %}
																<div class="alert alert-danger">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro o iniciá sesión.' | translate }}</div>
														{% elseif result.errors.email %}
																<div class="alert alert-danger">{{ 'Necesitamos un email válido para crear tu cuenta.' | translate }}</div>
														{% endif %}
										{% endblock input_form_alert %}
									{% endembed %}

									{# Password input #}
									<div class="loginlabel">Contraseña*</div>
									{% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_custom_class: 'loginreg-field pass w-input', input_for: 'password', input_name: 'password', input_id: 'password',input_placeholder: '', input_required: true} %}
										{% block input_form_alert %}
											{% if result.errors.password == 'required' %}
																<div class="alert alert-danger">{{ 'Necesitamos una contraseña para registrarte.' | translate }}</div>
														{% endif %}
										{% endblock input_form_alert %}
									{% endembed %}

									{# Password confirm input #}
									<div class="loginlabel">Confirmar Contraseña*</div>
									{% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_custom_class: 'loginreg-field pass w-input', input_for: 'password_confirmation', input_name: 'password_confirmation', input_id: 'password_confirmation', input_placeholder: '', input_required: true } %}
										{% block input_form_alert %}
											{% if result.errors.password == 'confirmation' %}
																<div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
														{% endif %}
										{% endblock input_form_alert %}
									{% endembed %}

									<p class="txtlogin">*Campos requeridos</p>
									{# Aceptar Términos #}
									<label class="w-checkbox accept-tyc">
										<div class="w-checkbox-input w-checkbox-input--inputType-custom termscheckbopx"></div>
										<input type="checkbox" name="checkbox-2" id="checkbox-2" data-name="Checkbox 2" required="" style="opacity:0;position:absolute;z-index:-1" oninvalid="this.setCustomValidity('Marque esta casilla si desea continuar')" oninput="this.setCustomValidity('')">
										<span class="labelcheck-tyc-2 w-form-label" for="checkbox-2">
											<a href="/aviso-de-privacidad/" class="tycregister-labellink">Acepto Aviso de Privacidad</a>
										</span>
									</label>
									
								{% endblock %}
							{% endembed %}

          </div>
        </div>
      </div>

    </div>
  </div>
{% endif %}

	<style>
   .form-group {
        margin-bottom: 0;
    } 

		a.js-password-view.btn.password-toggle {
				position: absolute;
				top: 94%;
				display: none;
		}

		.alert.alert-danger {
			margin-bottom: 15px;
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