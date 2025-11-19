{% if settings.news_show %}
<div id="w-node-_4e8f93f5-21ff-c475-b9c3-976ddd6d2c69-dd6d2c2b" class="w-layout-cell footercell">
  <div class="contitlecust">
    <h6 class="footertitle news">SUSCRÍBETE A NUESTRO <em class="footerbluetitle">NEWSLETTER</em></h6>
    <div class="linetitle small"></div>
  </div>

  <div class="newsletterform w-form js-newsletter newsletter">
    <div class="labelnews">
      Suscríbete y sé el primero en enterarte de nuestras promociones y novedades.
    </div>

    <form method="post"
          action="/winnie-pooh"
          onsubmit="this.setAttribute('action', '');"
          data-store="newsletter-form"
          class="contform">

      <input class="inputmailnews w-input"
             maxlength="256"
             name="email"
             placeholder="Ingresa tu correo aquí"
             type="email"
             id="email"
             required="">

      {# Honeypot (lo exige Tiendanube) #}
      <div class="winnie-pooh" style="display:none;">
        <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
        <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
      </div>

      <input type="hidden" name="name" value="{{ 'Sin nombre' | translate }}" />
      <input type="hidden" name="message" value="{{ 'Pedido de inscripción a newsletter' | translate }}" />
      <input type="hidden" name="type" value="newsletter" />

      <input type="submit" name="contact"
             class="suscribirbtn w-button"
             value="Suscribirme" />
    </form>

    {# Mensajes de éxito o error #}
    {% if contact and contact.type == 'newsletter' %}
      {% if contact.success %}
        <div class="w-form-done" style="display:block;">
          <div>{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
        </div>
      {% else %}
        <div class="w-form-fail" style="display:block;">
          <div>{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
        </div>
      {% endif %}
    {% endif %}
  </div>
</div>
{% endif %}
