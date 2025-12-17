<div class="js-addtocart js-addtocart-placeholder {% if not direct_add %}btn btn-primary btn-block{% endif %} btn-transition {{ custom_class }} disabled" style="display: none;">
    <div class="d-inline-block btnagregar w-button {{ custom_container_class }}">
        <span class="js-addtocart-text">
            {% if direct_add %}
                <div class="d-flex justify-content-center align-items-center">
                    {% if direct_add %}
                        <div class="btn-link" style="color:white; text-decoration:none;">
                    {% endif %}
                        {{ 'Agregando' | translate }}
                    {% if direct_add %}
                        </div>
                    {% endif %}
                    
                </div>
            {% else %}
                Agregar al carrito
            {% endif %}
        </span>
        <div class="js-addtocart-adding transition-container transition-icon">
            {{ 'Agregando' | translate }}
        </div>
    </div>
</div>

<style>
.js-addtocart-placeholder:has(.transition-container.active) 
  .js-addtocart-text {
  display: none !important;
}

</style>
