<div class="seccdetallecuenta">
    <div class="customcontainer">

        <div class="contitlecust">
            <h1 class="secctilte">EDITAR DATOS PERSONALES</h1>
            <div class="linetitle"></div>
        </div>

        <div class="contbtncuenta">
            <a href="/account" class="btnmicuenta w-button">Cancelar</a>
        </div>

        <div class="loginform direcciones">
            {% embed "snipplets/forms/form.tpl" with{form_id: 'info-form',form_custom_class: 'contenidoformlog' , submit_custom_class: 'btn-vip w-button', submit_text: 'Guardar cambios' | translate } %}
                {% block form_body %}

                    <div id="w-node-_9f527986-284d-96b0-d305-01327b2ed49a-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">

                        <div class="w-layout-cell centermiddlecell">
                            {# Name input #}
                            <div class="loginlabel">Nombre *</div>
                            {% embed "snipplets/forms/form-input.tpl" with{type_text: true, input_for: 'name', input_value: result.name | default(customer.name), input_name: 'name', input_id: 'name', input_custom_class: 'loginreg-field w-input',input_required: true } %}
                                {% block input_form_alert %}
                                    {% if result.errors.name %}
                                        <div class="notification-danger notification-left">{{ 'Necesitamos saber tu nombre para actualizar tu información.' | translate }}</div>
                                    {% endif %}
                                {% endblock input_form_alert %}
                            {% endembed %}
                        </div>

                        <div class="w-layout-cell centermiddlecell">
                            {# Email input #}
                            <div class="loginlabel">Correo electronico *</div>
                            {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: result.email | default(customer.email), input_name: 'email', input_id: 'email',input_custom_class: 'loginreg-field w-input',input_required: true } %}
                                {% block input_form_alert %}
                                    {% if result.errors.email == 'exists' %}
                                        <div class="notification-danger notification-left">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro.' | translate }}</div>
                                    {% elseif result.errors.email %}
                                        <div class="notification-danger notification-left">{{ 'Necesitamos saber tu email para actualizar tu información.' | translate }}</div>
                                    {% endif %}
                                {% endblock input_form_alert %}
                            {% endembed %}
                        </div>

                    </div>

                    <div id="w-node-_430fab72-db33-a7e5-928b-db14cb32ba97-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">
                        <div class="w-layout-cell centermiddlecell">
                            {# Phone input #}
                            <div class="loginlabel">Teléfono*</div>
                            {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_for: 'phone', input_value: result.phone | default(customer.phone), input_name: 'phone', input_id: 'phone',input_custom_class: 'loginreg-field w-input',input_required: true } %}
                            {% endembed %}
                        </div>
                        <div class="w-layout-cell centermiddlecell">
                            <p class="txtlogin">*Campos requeridos</p>
                        </div>
                    </div>

                {% endblock %}
            {% endembed %}
        </div>

    </div>
</div>

<style>
    .form-group {
        margin-bottom: 0px;
    }

    .contenidoformlog {
        margin-top: 0px;
        padding: 0px;
	}

    .form-group .form-select-icon {
        display: none;
    }

    .w-layout-layout {
        padding-bottom: 0px;
        padding-top: 5px;
    }

    button.btn.btn-primary.btn-big.btn-vip.w-button {
        margin-top: 20px;
    }

</style>