<div class="seccdetallecuenta">
    <div class="customcontainer">

        <div class="contitlecust">
            <h1 class="secctilte">{{ "MIS DIRECCIONES" | translate }}</h1>
            <div class="linetitle"></div>
        </div>

        <div class="contbtncuenta">
            <a href="/account" class="btnmicuenta w-button">
                {{ "Regresar" | translate }}
            </a>
            <a href="{{ store.customer_new_address_url }}" class="btnmicuenta w-button">
                {{ "Nueva dirección" | translate }}
            </a>
        </div>

        <div class="container-direcciones">
            {% for address in customer.addresses %}

                <div class="direccion-container">

                    <div class="conticons-editadress w-clearfix">
                        <a href="{{ store.customer_address_url(address) }}"
                            class="btndirecciones editar w-button">
                            {{ "Editar" | translate }}
                        </a>
                    </div>

                    <div class="infodireccion">
                        MI DIRECCIÓN<br><br>
                        {{ address | format_address | raw }}
                    </div>

                </div>

            {% endfor %}
        </div>
    </div>
</div>