{% set is_account_activation = action == 'account_activation' %}

<div class="seccmicuenta">
    <div class="customcontainer">
        <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-558b58e0" class="w-layout-layout stackcuenta wf-layout-layout">


            <div class="w-layout-cell centermiddlecell">
                <img src="{{ "images/logo_micuenta.png" | static_url }}" class="logologin">
            </div>

            <div class="w-layout-cell centermiddlecell">
                <div class="loginform">

                    {% if link_expired %}

                        {% set contact_links = store.whatsapp or store.phone or store.email %}
                        
                        <div class="text-center mb-4">
                            {% if is_account_activation %}
                                <div class="mb-1 font-weight-bold">{{ 'El link para activar tu cuenta expiró' | translate }}</div>
                                <div>{{ 'Contactanos para que te enviemos uno nuevo.' | translate }}</div>
                            {% else %}
                                <div class="mb-1 font-weight-bold">{{ 'El link para cambiar tu contraseña expiró' | translate }}</div>
                                <div class="mb-3">{{ 'Ingresá tu email para recibir uno nuevo.' | translate }}</div>
                                <a href="{{ store.customer_reset_password_url }}" class="btn-link">{{ 'Ingresar email' | translate }}</a>
                            {% endif %}
                        </div>

                        {% if contact_links and is_account_activation %}
                            <div class="text-center">
                                {% include "snipplets/contact-links.tpl" with {with_icons: true, phone_and_mail_only: true} %}
                            </div>
                        {% endif %}

                    {% else %}
                        {% if failure %}
                            <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                        {% endif %}

                        {% embed "snipplets/forms/form.tpl" with{form_id: 'newpass-form', form_custom_class: 'contenidoformlog' , submit_custom_class: 'btn-vip w-button', submit_text: (customer.password ? 'Cambiar contraseña' : 'Activar cuenta')  | translate } %}
                            {% block form_body %}

                                {# Password input #}
                                <div class="loginlabel">Contraseña*</div>
                                {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_custom_class: 'loginreg-field w-input' , input_for: 'password', input_name: 'password', input_id: 'password', } %}
                                {% endembed %}

                                {# Password confirm input #}
                                <div class="loginlabel">Confirmar contraseña*</div>
                                {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_custom_class: 'loginreg-field w-input' , input_for: 'password_confirm', input_name: 'password_confirm', input_id: 'password_confirm', } %}
                                {% endembed %}
                                
                            {% endblock %}
                        {% endembed %}
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