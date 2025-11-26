<div class="seccdetallecuenta">
  <div class="customcontainer">

    <div class="contitlecust">
      <h1 class="secctilte">{{ "DETALLE DEL PEDIDO" | translate }}</h1>
      <div class="linetitle"></div>
    </div>

    <div class="contbtncuenta">
      <a href="/account" class="btnmicuenta w-button">
        {{ "Regresar" | translate }}
      </a>
    </div>

    <div class="row-pedidos w-row">

      <div class="w-col w-col-3">

        <div class="contdetail-account">
          <h4 class="titles-micuenta">{{ "Información del pedido" | translate }}</h4>
        </div>

        <div class="cont-infodirecc w-clearfix">

          {% if log_entry %}
          <div class="infodireccion">
            <strong>{{ "Estado del envío" | translate }}:</strong><br>
            {{ log_entry }}
          </div>
          {% endif %}

          <div class="infodireccion">
            <strong>{{ "Fecha" | translate }}:</strong><br>
            {{ order.date | i18n_date('%d/%m/%Y') }}
          </div>

          <div class="infodireccion">
            <strong>{{ "Estado" | translate }}:</strong><br>
            {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}
          </div>

          <div class="infodireccion">
            <strong>{{ "Pago" | translate }}:</strong><br>
            {{ (order.payment_status == 'pending'? 'Pendiente' : 
              (order.payment_status == 'authorized'? 'Autorizado' : 
              (order.payment_status == 'paid'? 'Pagado' :
              (order.payment_status == 'voided'? 'Cancelado' :
              (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}
          </div>

          <div class="infodireccion">
            <strong>{{ "Medio de pago" | translate }}:</strong><br>
            {{ order.payment_name }}
          </div>

          {% if order.address %}
          <div class="infodireccion">
            <strong>{{ "Envío" | translate }}:</strong><br>
            {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}
          </div>

          <div class="infodireccion">
            <strong>{{ "Dirección de envío" | translate }}:</strong><br>
            {{ order.address | format_address }}
          </div>
          {% endif %}

        </div>

      </div>

      <div class="colhistorial w-col w-col-9">

        <div class="container-list-pedido">
          <h4 class="titles-micuenta">{{ "Productos del pedido" | translate }}</h4>

            {# ENCABEZADOS #}
            <div class="rowtitlepedidos w-row d-none d-md-flex">
                <div class="w-col w-col-2">
                    <div class="titlecol-pedido">{{ "Imagen" | translate }}</div>
                </div>
                <div class="w-col w-col-3">
                    <div class="titlecol-pedido">{{ "Producto" | translate }}</div>
                </div>
                <div class="w-col w-col-2">
                    <div class="titlecol-pedido">{{ "Precio" | translate }}</div>
                </div>
                <div class="w-col w-col-2">
                    <div class="titlecol-pedido">{{ "Cantidad" | translate }}</div>
                </div>
                <div class="w-col w-col-3">
                    <div class="titlecol-pedido">{{ "Total" | translate }}</div>
                </div>
            </div>

          

            {% for item in order.items %}
            <div class="rowpedido w-row order-item-row">
                <div class="w-col w-col-2">
                    <div class="card-img-square-container">
                        {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: "d-block card-img-square"}) }}
                    </div>
                </div>

                <div class="w-col w-col-3">
                    <div class="infopedido-list">

                        
                        <a href="{{ item.url }}" class="pedidonumero" style="text-decoration:none;">
                            {{ item.name }}
                        </a>

                    </div>
                </div>

                <div class="w-col w-col-2">
                    <div class="infopedido-list">
                        {{ item.unit_price | money }}
                    </div>
                </div>

                <div class="w-col w-col-2">
                    <div class="infopedido-list">
                        {{ item.quantity }}
                    </div>
                </div>

                <div class="w-col w-col-3">
                    <div class="infopedido-list text-center">
                        {{ item.subtotal | money }}
                    </div>
                </div>
            </div>
            {% endfor %}

          {# Totales #}

          {% if order.show_shipping_price %}
          <div class="mb-2 text-right infopedido-list">
            <strong>{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
            {% if order.shipping == 0 %}
            {{ "Gratis" | translate }}
            {% else %}
            {{ order.shipping | money_long }}
            {% endif %}
          </div>
          {% endif %}

          {% if order.discount %}
          <div class="mb-2 text-right infopedido-list">
            <strong>{{ "Descuento" | translate }}:</strong>
            -{{ order.discount | money }}
          </div>
          {% endif %}

          <div class="mb-2 text-right infopedido-list">
            <strong>{{ "Subtotal" | translate }}:</strong>
            {{ order.subtotal | money }}
          </div>

          <h3 class="font-huge mb-3 text-right titles-micuenta">
            {{ "Total" | translate }}: {{ order.total | money }}
          </h3>

          {% if order.pending %}
          <div class="text-right">
            <a class="btn-vip w-button" href="{{ order.checkout_url | add_param('ref','orders_details') }}">
              {{ "Realizar el pago" | translate }}
            </a>
          </div>
          {% endif %}

        </div>

      </div>

    </div>
  </div>
</div>

<style>
    .pedidonumero:hover {
        color: #0099d4;
        text-decoration: underline;
    }

    img.d-block.card-img-square {
        object-fit: contain;
    }

    a.btn-vip.w-button {
        float: right;
    }
</style>