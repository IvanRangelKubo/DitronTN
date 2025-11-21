{% if infinite_scroll %}

  {% if pages.current == 1 and not pages.is_last %}
    <div class="paginador">
      <a class="js-load-more pagelink">
        <span class="js-load-more-spinner" style="display:none;">
          {% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-spin"} %}
        </span>
        {{ 'Mostrar más productos' | t }}
      </a>
    </div>
    <div id="js-infinite-scroll-spinner" class="paginador" style="display:none">
      {% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-3x svg-icon-text icon-spin"} %}
    </div>
  {% endif %}


{% else %}

{% if pages.numbers %}
  <div class="paginador">
    {# Flecha izquierda #}
    {% if pages.previous %}
      <a href="{{ pages.previous }}" class="pagelink">&lt;</a>
    {% endif %}

    {% set total_pages = pages.numbers|length %}
    {% set current = pages.current %}
    {% set window_size = 4 %} {# número de páginas a mostrar en la ventana #}

    {% set start_page = current %}
    {% set end_page = current + window_size - 1 %}

    {# Ajustar si el final se pasa del total #}
    {% if end_page > total_pages %}
      {% set end_page = total_pages %}
    {% endif %}

    {# Mostrar ventana de páginas #}
    {% for page in pages.numbers %}
      {% if page.number >= start_page and page.number <= end_page %}
        <a href="{{ page.url }}" class="pagelink {% if page.selected %}active{% endif %}">
          {{ page.number }}
        </a>
      {% endif %}
    {% endfor %}

    {# Mostrar puntos suspensivos y última página si hace falta #}
    {% if end_page < total_pages %}
      <span class="pagelink">...</span>
      <a href="{{ pages.numbers[total_pages - 1].url }}" class="pagelink {% if pages.numbers[total_pages - 1].selected %}active{% endif %}">
        {{ total_pages }}
      </a>
    {% endif %}

    {# Flecha derecha #}
    {% if pages.next %}
      <a href="{{ pages.next }}" class="pagelink">&gt;</a>
    {% endif %}
  </div>
{% endif %}




{% endif %}
