{% set templateTitle = 'NUEVA DIRECCION' %}
{% if address.name %}
    {% set templateTitle = 'EDITAR DIRECCION' %}
{% endif %}

<div class="seccdetallecuenta">
    <div class="customcontainer">

        <div class="contitlecust">
            <h1 class="secctilte">{{ templateTitle }}</h1>
            <div class="linetitle"></div>
        </div>

        <div class="contbtncuenta">
            <a href="{{ store.customer_addresses_url }}" class="btnmicuenta w-button">Cancelar</a>
        </div>

        <p class="txtlogin">Completa los campos para añadir una nueva dirección de envío.</p>

        <div class="loginform direcciones">

            {% embed "snipplets/forms/form.tpl" 
                with {
                    form_id: 'address-form',
                    form_custom_class: 'contenidoformlog' ,
                    submit_custom_class: 'btn-vip w-button',
                    submit_text: 'Guardar Cambios' | translate
                }
            %}
                {% block form_body %}

                    <div id="w-node-_9f527986-284d-96b0-d305-01327b2ed49a-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">

                        <div class="w-layout-cell centermiddlecell">
                            {# Nombre (Alias) #}
                            <div class="loginlabel">Nombre (Alias)*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_text: true,
                                    input_for: 'name',
                                    input_value: result.name | default(address.name),
                                    input_name: 'name',
                                    input_id: 'aliasdir',
                                    input_placeholder: '',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.name %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Ingresá un alias para reconocer esta dirección en el futuro.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                        <div class="w-layout-cell centermiddlecell">
                            {# Dirección #}
                            <div class="loginlabel">Dirección (calle, número y colonia)*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_text: true,
                                    input_for: 'address',
                                    input_value: result.address | default(address.address),
                                    input_name: 'address',
                                    input_id: 'direccion',
                                    input_placeholder: '',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.address %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Necesitamos una dirección para enviar tus pedidos.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                    </div>


                    <div id="w-node-_430fab72-db33-a7e5-928b-db14cb32ba97-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">

                        <div class="w-layout-cell centermiddlecell">
                            {# Código Postal #}
                            <div class="loginlabel">Código Postal*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_tel: true,
                                    input_for: 'zipcode',
                                    input_value: result.zipcode | default(address.zipcode),
                                    input_name: 'zipcode',
                                    input_id: 'cp',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.zipcode %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Por favor, ingresá tu código postal.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                        <div class="w-layout-cell centermiddlecell">
                            {# Ciudad #}
                            <div class="loginlabel">Ciudad*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_text: true,
                                    input_for: 'city',
                                    input_value: result.city | default(address.city),
                                    input_name: 'city',
                                    input_id: 'ciudad',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.city %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Por favor, ingresá tu ciudad.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                    </div>

                    <div id="w-node-_21df50ce-316d-7f68-6d08-c9dad8513241-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">

                        <div class="w-layout-cell centermiddlecell">
                            {# Estado/Provincia #}
                            <div class="loginlabel">Estado*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_text: true,
                                    input_for: 'province',
                                    input_value: result.province | default(address.province),
                                    input_name: 'province',
                                    input_id: 'estado',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.province %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Necesitamos saber tu provincia para actualizar tu información.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                        <div class="w-layout-cell centermiddlecell">
                            {# País #}
                            <div class="loginlabel">País</div>
                            {% embed "snipplets/forms/form-select.tpl" 
                                with {
                                    select_for: 'country',
                                    select_name: 'country',
                                    select_id: 'pais',
                                    select_custom_class: 'loginreg-field w-select',
                                    select_label_name: ''
                                } 
                            %}
                                {% block select_options %}
                                    {{ country_options }}
                                {% endblock %}
                            {% endembed %}
                        </div>

                    </div>

                    <div id="w-node-f0bf2cbb-fc0f-c94f-f944-0cfd9036af74-e0290c7a" class="w-layout-layout stackcuenta wf-layout-layout">

                        <div class="w-layout-cell centermiddlecell">
                            {# Teléfono #}
                            <div class="loginlabel">Teléfono*</div>
                            {% embed "snipplets/forms/form-input.tpl" 
                                with {
                                    type_tel: true,
                                    input_for: 'phone',
                                    input_value: result.phone | default(address.phone),
                                    input_name: 'phone',
                                    input_id: 'telefono',
                                    input_custom_class: 'loginreg-field w-input',
                                    input_required: true
                                } 
                            %}
                                {% block input_form_alert %}
                                    {% if result.errors.phone %}
                                        <div class="notification-danger notification-left">
                                            {{ 'Necesitamos saber tu teléfono para actualizar tu información.' | translate }}
                                        </div>
                                    {% endif %}
                                {% endblock %}
                            {% endembed %}
                        </div>

                        <div class="w-layout-cell centermiddlecell">
                            <p class="txtlogin mt-2">*Campos requeridos</p>
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

    select.form-select.loginreg-field.w-select {
        appearance: auto !important;
    }

    select#estado {
        color: var(--darkgrey);
        background-color: #fff;
        border: 1px solid #acacac;
        border-radius: 9px;
        width: 100%;
        height: 45px;
        margin-bottom: 12px;
        padding: 10px;
        font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
        font-size: 14px;
        font-weight: 500;
        line-height: 18px;
    }

    button.btn.btn-primary.btn-big.btn-vip.w-button {
        margin-top: 20px;
    }

    span.js-form-spinner {
        position: absolute;
    }


    @media (min-width: 768px) and (max-width: 1024px) {
        p.txtlogin {
            max-width: 65%;
        }
    }

</style>

<script>
document.addEventListener("DOMContentLoaded", () => {
    const countrySelect = document.querySelector('select[name="country"]');
    const savedProvince = "{{ address.province | e('js') }}"; 

    if (!countrySelect) return;

    const mxOption = Array.from(countrySelect.options).find(
        opt => opt.value.toLowerCase().includes("méxico") || opt.text.toLowerCase().includes("méxico")
    );
    if (mxOption) {
        mxOption.selected = true;
        countrySelect.dispatchEvent(new Event("change", { bubbles: true }));
    }

    const trySetProvince = () => {
        const stateSelect = document.querySelector('select[name="province"]');
        if (!stateSelect) return false;

        const option = Array.from(stateSelect.options).find(
            o => o.value.trim().toLowerCase() === savedProvince.trim().toLowerCase()
        );

        if (option) {
            option.selected = true;
            stateSelect.dispatchEvent(new Event("change", { bubbles: true }));
        }

        return !!option;
    };

    let attempts = 0;
    const interval = setInterval(() => {
        attempts++;
        if (trySetProvince() || attempts > 20) {
            clearInterval(interval);
        }
    }, 100);
});
</script>


<script>
  document.addEventListener('DOMContentLoaded', () => {

    (function fixButtonSpinner() {
    
      function ensureTextWrapper(btn) {
        
        const hasTextSpan = btn.querySelector(':scope > .btn-text');
        if (hasTextSpan) return hasTextSpan;


        const textNodes = Array.from(btn.childNodes).filter(n => n.nodeType === Node.TEXT_NODE && n.textContent.trim().length > 0);
        if (textNodes.length === 0) return null;

        
        const span = document.createElement('span');
        span.className = 'btn-text';
        span.style.transition = 'opacity .12s linear';
        textNodes.forEach(n => {
          span.appendChild(n);
        });

        const spinner = btn.querySelector('.js-form-spinner');
        if (spinner) btn.insertBefore(span, spinner);
        else btn.appendChild(span);
        return span;
      }

      
      const buttons = Array.from(document.querySelectorAll('button, input[type="submit"]')).filter(b => b.querySelector && b.querySelector('.js-form-spinner'));
      buttons.forEach(btn => {
        const textSpan = ensureTextWrapper(btn);
        const spinner = btn.querySelector('.js-form-spinner');

        
        function updateVisuals() {
          const style = window.getComputedStyle(spinner);
          const visible = !(style.display === 'none' || style.visibility === 'hidden' || spinner.offsetParent === null && style.display !== 'inline');
          if (textSpan) {
            textSpan.style.opacity = visible ? '0' : '1';
        
            textSpan.setAttribute('aria-hidden', visible ? 'true' : 'false');
          }
        }

        
        const mo = new MutationObserver(() => updateVisuals());
        mo.observe(spinner, { attributes: true, attributeFilter: ['style', 'class', 'hidden'], childList: false, subtree: false });

        
        const form = btn.closest('form');
        if (form) {
          form.addEventListener('submit', () => {
            try {
              spinner.style.display = 'inline-block';
              
              spinner.style.visibility = 'visible';
            } catch (e) {}
            
            if (textSpan) {
              textSpan.style.opacity = '0';
              textSpan.setAttribute('aria-hidden', 'true');
            }
          });
        }

        updateVisuals();
      });
    })();
  });
</script>