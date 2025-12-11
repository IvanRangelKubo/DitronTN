  <div class="seccmicuenta">
    <div class="customcontainer">
      <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-558b58e0" class="w-layout-layout stackcuenta wf-layout-layout">
        <div class="w-layout-cell centermiddlecell"><img src="{{ "images/logo_micuenta.png" | static_url }}" class="logologin"></div>
        <div class="w-layout-cell centermiddlecell">
          <div class="loginform w-form">

						{% embed "snipplets/forms/form.tpl" with{form_id: 'login-form', form_custom_class: 'contenidoformlog' , submit_custom_class: 'btn-vip w-button', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
								{% block form_body %}
										<div class="contitlecust">
											<h1 class="secctilte">INICIAR SESIÓN</h1>
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
												<div class="alert alert-danger">{{ 'Estos datos no son correctos. ¿Checaste que estén bien escritos?' | translate }}</div>
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

		svg.icon-inline.icon-spin.icon-w-2em.ml-3 {
			margin: 0px !important;
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
