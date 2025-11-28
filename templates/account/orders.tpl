<div class="seccdetallecuenta">
    <div class="customcontainer">

    <div class="contitlecust">
        <h1 class="secctilte">{{ "MI CUENTA" | translate }}</h1>
        <div class="linetitle"></div>
    </div>

    <div class="contbtncuenta">
        <a href="{{ store.customer_logout_url }}" class="btnmicuenta w-button">
        {{ "Cerrar sesión" | translate }}
        </a>
    </div>

    <div class="row-pedidos w-row">
        
        <div class="w-col w-col-3">

            <div class="contdetail-account">
                <h4 class="titles-micuenta">{{ "Datos Personales" | translate }}</h4>
            </div>

            <div class="cont-infodirecc w-clearfix">
                <div class="infodireccion">
                    <strong>{{ customer.name }}</strong><br>
                    {{ customer.email }}<br>
                    {% if customer.phone %}
                        {{ customer.phone }}<br>
                    {% endif %}
                </div>
                <a href="{{ store.customer_info_url }}" class="btndirecciones w-button">
                    {{ "Editar datos" | translate }}
                </a>
                <div class="infodireccion">
                    {% if customer.default_address %}
                        MI DIRECCIÓN<br>
                        {{ customer.default_address | format_address_short }}
                    {% endif %}
                </div>

                <a href="{{ store.customer_addresses_url }}" class="btndirecciones w-button">
                    {{ "Ver direcciones" | translate }}
                    {% if customer.addresses %}
                        ({{ customer.addresses | length }})
                    {% endif %}
                </a>
            </div>
        </div>


        <div class="colhistorial w-col w-col-9">

        <div class="container-list-pedido">
            <h4 class="titles-micuenta">{{ "Historial de pedidos" | translate }}</h4>

            <div class="rowtitlepedidos w-row">
            <div class="w-col w-col-2 w-col-small-2">
                <div class="titlecol-pedido">{{ "Pedido" | translate }}</div>
            </div>
            <div class="w-col w-col-10 w-col-small-10">
                <div class="w-row">
                <div class="w-col w-col-3 w-col-small-3">
                    <div class="titlecol-pedido">{{ "Fecha" | translate }}</div>
                </div>
                <div class="w-col w-col-3 w-col-small-3">
                    <div class="titlecol-pedido">{{ "Estatus del pedido" | translate }}</div>
                </div>
                <div class="w-col w-col-3 w-col-small-3">
                    <div class="titlecol-pedido">{{ "Estatus del pago" | translate }}</div>
                </div>
                <div class="w-col w-col-3 w-col-small-3">
                    <div class="titlecol-pedido">{{ "Total" | translate }}</div>
                </div>
                </div>
            </div>
            </div>

            {% if customer.orders %}
            
            {% for order in customer.orders %}
            <div class="rowpedido w-row">
                <div class="w-col w-col-2 w-col-small-2">
                <a href="{{ store.customer_order_url(order) }}" class="pedidonumero">
                    #{{ order.number }}
                </a>
                </div>

                <div class="w-col w-col-10 w-col-small-10">
                <div class="infopedido-datos w-row">

                    <div class="w-col w-col-3">
                    <div class="infopedido-list">
                        {{ order.date | i18n_date('%d/%m/%Y') }}
                    </div>
                    </div>

                    <div class="w-col w-col-3">
                    <div class="infopedido-list">
                        {# Traducción del status #}
                        {{ (order.shipping_status == 'fulfilled' ? 'Enviado' : 'No enviado') | translate }}
                    </div>
                    </div>

                    <div class="w-col w-col-3">
                    <div class="infopedido-list">
                        {{ (order.payment_status == 'pending'? 'Pendiente' : 
                            (order.payment_status == 'authorized'? 'Autorizado' : 
                            (order.payment_status == 'paid'? 'Pagado' : 
                            (order.payment_status == 'voided'? 'Cancelado' : 
                            (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}
                    </div>
                    </div>

                    <div class="w-col w-col-3">
                    <div class="infopedido-list">
                        {{ order.total | money }}
                    </div>
                    </div>

                </div>
                </div>
            </div>
            {% endfor %}

            {% else %}

            <div class="rowpedido w-row">
                <div class="w-col w-col-12 text-center">
                <p>{{ "¡Hacé tu primera compra!" | translate }}</p>
                <a href="{{ store.url }}" class="btnmicuenta w-button">
                    {{ "Ir a la tienda" | translate }}
                </a>
                </div>
            </div>

            {% endif %}

        </div>
        </div>
    </div>
    </div>
</div>

<style>

@media screen and (max-width: 479px) {
    .infopedido-list {
        white-space: normal;
    }
}

@media (min-width: 768px) and (max-width: 1024px) {
    .cont-infodirecc.w-clearfix {
        display: flex;
        flex-direction: column;
    }
}

</style>