{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    <ul role="list" class="arbol-navegacion">

        {# Inicio siempre #}
        <li class="list-item-arbol">
        <a href="{{ store.url }}" class="categoria-arbol">Inicio &gt;</a>
        </li>

        {# Casos especiales según el template #}
        {% if template == 'page' %}
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ page.name }}</span>
            </li>

        {% elseif template == 'cart' %}
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ "Carrito de compras" | translate }}</span>
            </li>

        {% elseif template == 'search' %}
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ "Resultados de búsqueda" | translate }}</span>
            </li>

        {% elseif template == 'account.order' %}
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ 'Orden {1}' | translate(order.number) }}</span>
            </li>

        {% elseif template == 'blog' %}
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ 'Blog' | translate }}</span>
            </li>

        {% elseif template == 'blog-post' %}
            <li class="list-item-arbol">
            <a href="{{ store.blog_url }}" class="categoria-arbol">Blog &gt;</a>
            </li>
            <li class="list-item-arbol">
            <span class="categoria-arbol active">{{ post.title }}</span>
            </li>

        {% else %}
            {# Iteración normal #}
            {% for crumb in breadcrumbs %}
                <li class="list-item-arbol">
                    {% if crumb.last %}
                    <span class="categoria-arbol active">{{ crumb.name }}</span>
                    {% else %}
                    <a href="{{ crumb.url }}" class="categoria-arbol">{{ crumb.name }} &gt;</a>
                    {% endif %}
                </li>
            {% endfor %}
        {% endif %}

    </ul>
{% endif %}

<style>
    ul.arbol-navegacion {
        display: flex;
        gap: 5px;
        flex-wrap: wrap;
    }
</style>