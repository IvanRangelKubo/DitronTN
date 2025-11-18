{% set form_container_floating_class = not settings.search_big_desktop ? 'search-container-floating' %}
{% set form_container_padding_md_class = settings.search_big_desktop ? 'pt-md-0 mb-md-0' : 'pt-md-3' %}
{% set form_container_classes = not_padding ? 'py-0 mb-0 ' ~ form_container_floating_class : 'position-relative-md py-4 pb-md-0 px-3 mb-1 ' ~ form_container_padding_md_class %}

{% if search_modal %}
    <a href="#" class="js-modal-close js-fullscreen-modal-close search-btn search-close-btn d-md-none">
    	<svg class="icon-inline icon-lg svg-icon-text icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
    </a>
{% endif %}

<div class="searchForm" >
	<div data-w-id="19bfc965-78d2-2790-076e-c7279723f410" class="close-buscador">X</div>
	{{ component('search/search-form', {
		form_classes: { 
		form: 'busqueda-formcot', 
		input_group: 'inputGroup', 
		input: 'input-buscador w-input', 
		submit: 'buscarbtn w-button', 
		search_suggestions_container: 'contsearchpredictive'}, 
		placeholder_text: '¿Qué estás buscando?' 
			}
		) 
	}}
</div>

<style>
	.searchForm {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
	}

	form.js-search-form.search-form.busqueda-formcot.expanded {
			margin-left: 0;
			margin-right: 0;
	}

	.form-group.inputGroup {
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0px;
	}

	button.js-search-input-submit.search-btn.search-submit-btn.buscarbtn.w-button {
			top: 9px;
	}

	.buscarbtn.w-button:focus {
    opacity: inherit;
	}

	.search-btn:before {
    display: none;
	}

	.buscarbtn::after {
		content: "Buscar";
	}

</style>