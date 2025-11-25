  <div class="seccmicuenta">
    <div class="customcontainer">
      <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-558b58e0" class="w-layout-layout stackcuenta wf-layout-layout">
        <div class="w-layout-cell centermiddlecell"><img src="{{ "images/logo_micuenta.png" | static_url }}" class="logologin"></div>
        <div class="w-layout-cell centermiddlecell">
          <div class="loginform w-form">

						{% embed "snipplets/forms/form.tpl" with{form_id: 'login-form', form_custom_class: 'contenidoformlog' , submit_custom_class: 'btn-vip w-button', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
								{% block form_body %}
										<div class="contitlecust">
											<h1 class="secctilte">INICAR SESIÓN</h1>
											<div class="linetitle"></div>
										</div>
										<div class="loginlabel">Correo electrónico*</div>
										{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email',input_placeholder: '', input_custom_class: 'loginreg-field w-input' , type_email: true, input_name: 'email', input_required: true } %}
										{% endembed %}
										<div class="loginlabel">Contraseña*</div>
										{% embed "snipplets/forms/form-input.tpl" with{input_for: 'password',input_placeholder: '', input_custom_class: 'loginreg-field w-input', type_password: true, input_name: 'password', input_required: true } %}
										{% endembed %}

										<p class="txtlogin">*Campos requeridos</p>

										{% if result.invalid %}
												<div class="alert alert-danger">{{ 'Estos datos no son correctos. ¿Chequeaste que estén bien escritos?' | translate }}</div>
										{% endif %}
										
								{% endblock %}
								
						{% endembed %}
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

		span.js-form-spinner {
    position: absolute;
	}

		button:has(.js-form-spinner[style*="display: block"]) {
			color: transparent !important;
		}

</style>