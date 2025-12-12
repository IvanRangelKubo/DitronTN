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

					<div class="mb-3 font-small">
						¿Todavía no lo recibiste? <span class="js-resend-validation-link btn-link font-small ml-1" data-customer-email="{{ customer_email }}" >Enviar link de nuevo</span>
					</div>

					<div class="js-resend-validation-success alert alert-success" style="display:none">
						<p class="registerSuccess">{{ "¡El link fue enviado correctamente!" | translate }}</p>
					</div>
					<div class="js-resend-validation-error alert alert-danger" style="display:none">
						<p class="registerSuccess">{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
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
											<a href="/aviso-de-privacidad/" class="tycregister-labellink" style="text-decoration:underline;" target="_blank">Acepto Aviso de Privacidad</a>
										</span>
									</label>
									
								{% endblock %}
							{% endembed %}

							<div id="errorContainer"></div>

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

		p.registerSuccess {
			margin: 0px;
		}

		svg.icon-inline.icon-spin.icon-w-2em.ml-3 {
			margin: 0px !important;
		}

		.mb-3.font-small {
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
		}

</style>

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

<script>
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('form[data-store="account-register"]');
  if (!form) return;

  const submitBtn = form.querySelector('button[type="submit"], input[type="submit"]');
  const spinner  = form.querySelector('.js-form-spinner');

  const offSpinner = () => {
    if (spinner) spinner.style.display = 'none';
    if (submitBtn) submitBtn.disabled = false;
  };

  const hasToken = () => {
    try {
      if (window.grecaptcha && typeof window.grecaptcha.getResponse === "function") {
        const r = window.grecaptcha.getResponse();
        if (r && r.length > 0) return true;
      }
    } catch(e){}
    const t = form.querySelector('#g-recaptcha-response');
    return t && t.value.trim().length > 0;
  };

  const showError = () => {
    offSpinner();

    if (!form.querySelector('.recaptcha-error-msg')) {
      const alert = document.createElement('div');
      alert.className = 'alert alert-danger recaptcha-error-msg';
      alert.textContent = 'Debes completar el reCAPTCHA para continuar.';
      form.insertBefore(alert, form.firstChild);
    }
    const g = form.querySelector('.g-recaptcha');
    if (g) {
			g.style.margin = '0px'
    }
  };

  const clearError = () => {
    const e = form.querySelector('.recaptcha-error-msg');
    if (e) e.remove();
    const g = form.querySelector('.g-recaptcha');
    if (g) {
      g.style.boxShadow = '';
      g.style.border = '';
    }
  };

  form.addEventListener('submit', ev => {
    if (hasToken()) return;
    ev.preventDefault();
    ev.stopImmediatePropagation();
    showError();
    offSpinner();
    return false;
  });

  const nativeSubmit = HTMLFormElement.prototype.submit;
  HTMLFormElement.prototype.submit = function () {
    if (this === form && !hasToken()) {
      showError();
      offSpinner();
      return;
    }
    return nativeSubmit.call(this);
  };

  const tokenEl = form.querySelector('#g-recaptcha-response');
  if (tokenEl) {
    const obs = new MutationObserver(() => {
      if (hasToken()) clearError();
    });
    obs.observe(tokenEl, { attributes: true, attributeFilter: ['value'] });

    tokenEl.addEventListener('input', () => {
      if (hasToken()) clearError();
    });
  }
});
</script>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("errorContainer");
    if (!container) return;
    
    moveAlerts();

    const observer = new MutationObserver(() => {
      moveAlerts();
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true,
    });

    function moveAlerts() {
      const alerts = document.querySelectorAll(".alert.alert-danger");
      alerts.forEach(alert => {
        if (!container.contains(alert)) {
          container.appendChild(alert);
        }
      });
    }
  });
</script>