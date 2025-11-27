{% if product_filters is not empty %}
    {# Filters list #}
    <div id="filters" class="visible-when-content-ready" data-store="filters-nav">
        {% for product_filter in product_filters %}
            {% if product_filter.type == 'price' %}
                <div class="filterCont mb-3 pb-1">
                    <div class="filterActivator" role="button" aria-expanded="false" tabindex="0">
                        Precio
                    </div>

                    <div class="filterContainer js-price-filter-container price-filter-container mb-3 pb-1" aria-hidden="true">
                        {{ component(
                            'price-filter',
                            {'group_class': 'price-filter-container mb-3 pb-1', 'title_class': 'font-small font-weight-bold mb-4', 'button_class': 'btn btn-default d-inline-block' }
                        ) }}
                    </div>
                </div>
            {% else %}
                {% if product_filter.has_products %}
                    <div class="filterCont js-accordion-container mb-3 pb-1" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                        <div class="filterActivator" role="button" aria-expanded="false" tabindex="0">
                            {{ product_filter.name }}
                        </div>

                        <div class="filterContainer">
                            <div class="font-small font-weight-bold mt-3 mb-4 sr-only">{{product_filter.name}}</div>
                            {% set index = 0 %}
                            {% for value in product_filter.values %}
                                {% if value.product_count > 0 %}
                                    {% set index = index + 1 %}

                                    <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                        <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                        <span class="checkbox">
                                            <span class="checkbox-icon"></span>
                                            <span class="checkbox-text with-color">
                                                {{ value.name }} <span class="ml-1">({{ value.product_count }})</span>
                                            </span>
                                            {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                            {% endif %}
                                        </span>
                                    </label>

                                    {% if index == 8 and product_filter.values_with_products > 8 %}
                                        <div class="js-accordion-content" style="display: none;">
                                    {% endif %}
                                {% endif %}

                                {% if loop.last and product_filter.values_with_products > 8 %}
                                    </div>
                                    <a href="#" class="js-accordion-toggle d-inline-block btn-link font-small mb-3">
                                        <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                        <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                        </div>
                    </div>
                {% endif %}
            {% endif %}
        {% endfor %}
    </div>
{% endif %}

{# Applied filters chips (sin cambios) #}
{% if has_applied_filters %}
    <div class="mb-4">
        {% for product_filter in product_filters %}
            {% for value in product_filter.values %}
                {% if value.selected %}
                    <button class="js-remove-filter js-remove-filter-chip chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                        {{ value.pill_label }}
                        <svg class="icon-inline chip-remove-icon"><use xlink:href="#times"/></svg>
                    </button>
                {% endif %}
            {% endfor %}
        {% endfor %}
        <a href="#" class="js-remove-all-filters btn-link font-small d-inline-block" data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a>
    </div> 
{% endif %}

<style>

#filters {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.filterCont {
  position: relative;
}

.filterActivator {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 100px;
  border: 2px solid var(--ditron-blue);
  border-radius: 9px;
  padding: 6px 10px;
  cursor: pointer;
  user-select: none;
  background: white;
}

.filterContainer {
  position: absolute;
  left: 0;
  top: calc(100% + 8px);
  z-index: 999;
  background: white;
  border: 1px solid gainsboro;
  box-shadow: 2px 2px 6px rgba(0,0,0,0.08);
  border-radius: 9px;
  padding: 12px 15px;
  display: none; 
  min-width: 240px;
}

.filterContainer.is-visible {
  display: block;
}

.filterContainer .font-small.font-weight-bold.mt-3.mb-4 {
  display: none;
}

.font-small.font-weight-bold.mb-4 {
    display: none;
}

.js-price-filter-container.price-filter-container.mb-3.pb-1 {
    min-width: max-content;
}

</style>


<script>
document.addEventListener('DOMContentLoaded', () => {
  
  const closeOthersWhenOpen = true;

  
  document.querySelectorAll('.filterCont').forEach((block) => {
    const activator = block.querySelector('.filterActivator');
    const container = block.querySelector('.filterContainer');

    if (!activator || !container) return;

    
    activator.setAttribute('role', 'button');
    activator.setAttribute('tabindex', '0');
    activator.setAttribute('aria-expanded', 'false');
    container.setAttribute('aria-hidden', 'true');

    const open = () => {
      if (closeOthersWhenOpen) {
        document.querySelectorAll('.filterContainer.is-visible').forEach((other) => {
          if (other !== container) {
            other.classList.remove('is-visible');
            const otherAct = other.closest('.filterCont')?.querySelector('.filterActivator');
            if (otherAct) otherAct.setAttribute('aria-expanded', 'false');
            other.setAttribute('aria-hidden', 'true');
          }
        });
      }
      container.classList.add('is-visible');
      activator.setAttribute('aria-expanded', 'true');
      container.setAttribute('aria-hidden', 'false');
    };

    const close = () => {
      container.classList.remove('is-visible');
      activator.setAttribute('aria-expanded', 'false');
      container.setAttribute('aria-hidden', 'true');
    };

    
    activator.addEventListener('click', (e) => {
      
      container.classList.contains('is-visible') ? close() : open();
    });

    
    activator.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        activator.click();
      } else if (e.key === 'Escape') {
        close();
      }
    });

    
  });

  
  document.addEventListener('click', (e) => {
    if (!e.target.closest('.filterCont')) {
      document.querySelectorAll('.filterContainer.is-visible').forEach((c) => {
        c.classList.remove('is-visible');
        const act = c.closest('.filterCont')?.querySelector('.filterActivator');
        if (act) act.setAttribute('aria-expanded', 'false');
        c.setAttribute('aria-hidden', 'true');
      });
    }
  });

  
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      document.querySelectorAll('.filterContainer.is-visible').forEach((c) => {
        c.classList.remove('is-visible');
        const act = c.closest('.filterCont')?.querySelector('.filterActivator');
        if (act) act.setAttribute('aria-expanded', 'false');
        c.setAttribute('aria-hidden', 'true');
      });
    }
  });
});
</script>


