<div class="seccmicuenta">
  <div class="customcontainer">
    <div id="w-node-_1972abc9-70be-a0e1-cacb-5136464458f1-558b58e0" class="w-layout-layout stackcuenta wf-layout-layout">

      <div class="w-layout-cell centermiddlecell">
        <img src="{{ "images/logo_micuenta.png" | static_url }}" class="logologin">
      </div>

      <div class="w-layout-cell centermiddlecell">
        <div class="loginform w-form">

          <div class="contitlecust">
            <h1 class="secctilte">INICIAR SESIÓN</h1>
            <div class="linetitle"></div>
          </div>

          {{ component('forms/account/login' , {
            validation_classes: {
              link: 'btn-link font-small ml-1',
              text_align: 'text-center',
              text_size: 'font-small',
            },
            spacing_classes: {
              top_2x: 'mt-2',
              bottom_2x: 'mb-2',
              bottom_3x: 'mb-3',
              bottom_4x: 'mb-4',
            },
            form_classes: {
              facebook_login: 'btn btn-secondary d-block mb-4',
              password_toggle: 'btn',
              input_help_align: 'text-right',
              input_help_link: 'txtlogin',
              help_align: 'text-center',
              help_text_size: 'font-small',
              help_link: 'destacadoblue',
              submit: 'btn-vip w-button',
              submit_spinner: 'icon-inline icon-spin ml-2'
            }
          }) }}

          <div id="errorContainer"></div>

          <p class="txtlogin" id="req">*Campos requeridos</p>

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

    .mt-2.mb-2.text-center.font-small {
      color: #454545 !important;
      text-align: left !important;
      width: 100% !important;
      margin: 20px auto 10px !important;
      font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
      font-size: 14px !important;
      font-weight: 600 !important;
      line-height: 18px !important;
    }

    .text-right.mt-2.mb-2 {
      text-align: left !important;
    }

    label.form-label {
      width: 100% !important;
      margin-bottom: 3px !important;
      font-family: Elmssans Variablefont Wght, Verdana, sans-serif !important;
      font-weight: 600 !important;
      display: block !important;
      font-size: 14px !important;
    }

    input.js-account-input.form-control {
      position: relative;
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

    a.js-password-toggle.password-toggle.btn {
        display: none;
    }

    span.js-form-spinner {
      position: absolute;
    }

		svg.icon-inline.icon-spin.icon-w-2em.ml-3 {
			margin: 0px !important;
    }

    svg.icon-inline.icon-spin use {
      fill: #fff !important;
    }

    
</style>


<script>
document.addEventListener("DOMContentLoaded", () => {
  const loginForm = document.querySelector("#login-form");
  if (!loginForm) return;

  const spinner = loginForm.querySelector(".js-form-spinner");

  // Si falta el SVG o está vacío, lo reemplazamos
  if (!spinner || !spinner.querySelector("svg")) {
    const newSpinner = document.createElement("span");
    newSpinner.className = "js-form-spinner fixed-spinner";
    newSpinner.style.display = "none";
    newSpinner.innerHTML = `
      <svg class="icon-inline icon-spin icon-w-2em ml-3 spinner-white">
        <use xlink:href="#spinner-third"></use>
      </svg>
    `;
    if (spinner) spinner.replaceWith(newSpinner);
  }
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


<script>
  document.addEventListener("DOMContentLoaded", () => {

    const requiredLabels = ["email", "password"];

    requiredLabels.forEach(id => {
      const label = document.querySelector(`label.form-label[for="${id}"]`);
      if (label && !label.textContent.trim().endsWith("*")) {
        label.textContent = label.textContent.trim() + "*";
      }
    });

    const reqText = document.querySelector("#req");
    const submitBtn = document.querySelector('.btn-vip');

    if (reqText && submitBtn) {
      submitBtn.parentNode.insertBefore(reqText, submitBtn);
      reqText.style.display = "block";
    }

    const forgotDiv = document.querySelector('.text-right.mt-2.mb-2');
    const noAccountText = document.querySelector('.mt-2.mb-2.text-center.font-small'); 

    if (forgotDiv && noAccountText) {
      noAccountText.parentNode.insertBefore(forgotDiv, noAccountText.nextSibling);
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
      const alerts = document.querySelectorAll(".alert.alert-danger.js-login-general-error");
      alerts.forEach(alert => {
        if (!container.contains(alert)) {
          container.appendChild(alert);
        }
      });
    }
  });
</script>



