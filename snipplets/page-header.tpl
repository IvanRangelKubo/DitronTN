{# /*============================================================================
  #Page header
==============================================================================*/

#Properties

#Title

#Breadcrumbs 

#}

{% if template == 'category' or template == 'search' %}
  <div class="headerlisting" >
    <div class="customcontainer">
			<div class="infoheaderlisting">

      	{% include "snipplets/breadcrumbs.tpl" %}
				
				<div class="contitlecust">
          <h1 class="secctilte listing">{% block page_header_text %}{% endblock %}</h1>
          <div class="linetitle"></div>
        </div>

			</div>
    </div>
  </div>
{% endif %}
