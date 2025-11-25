  <div class="seccmicuenta">
    <div class="customcontainer">
      <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-558b58e0" class="w-layout-layout stackcuenta wf-layout-layout">

        <div class="w-layout-cell centermiddlecell">
            <img src="{{ "images/logo_micuenta.png" | static_url }}" class="logologin">
        </div>

        <div class="w-layout-cell centermiddlecell">
          <div class="loginform">

            {% embed "snipplets/forms/form.tpl" with{form_id: 'resetpass-form', submit_custom_class: 'btn-vip w-button', submit_text: 'Enviar email' | translate } %}
                {% block form_body %}

                    <div class="contitlecust">
                        <h1 class="secctilte">RECUPERAR CONTRASEÑA</h1>
                        <div class="linetitle"></div>
                    </div>

                    {# Email input #}
                    <div class="loginlabel">Correo electrónico*</div>
                    {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_custom_class: 'loginreg-field w-input', input_for: 'email', input_value: email, input_name: 'email', input_id: 'email', input_placeholder: 'ej.: tuemail@email.com' | translate } %}
                        {% block input_label_text %}{{ 'Email' | translate }}{% endblock input_label_text %}
                        {% block input_form_alert %}
                            {% if failure %}
                                <div class="alert alert-danger">{{ 'No encontramos ninguna cuenta registrada con este email. Intentalo nuevamente chequeando que esté bien escrito.' | translate }}</div>
                            {% endif %}
                        {% endblock input_form_alert %}
                    {% endembed %}
                    
                {% endblock %}
            {% endembed %}

            {% if success %}
                <div class="alert alert-success">{{ '¡Listo! Te enviamos un email a {1}' | translate(email) }}</div>
            {% endif %}

          </div>
        </div>

      </div>
    </div>
  </div>

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