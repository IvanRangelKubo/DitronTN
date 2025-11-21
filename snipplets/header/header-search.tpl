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

	.js-search-form-suggestions.search-suggestions.contsearchpredictive {
    width: 70%;
    margin: auto;
    inset: 64% 0% auto;
    max-width: 800px;
	}

	li.search-suggestions-item {
			color: #454545;
			text-align: left !important;
			width: 100%;
			font-family: Montserrat, sans-serif;
			font-size: 12px;
			font-weight: 500;
			line-height: 15px;
			text-decoration: none;
			max-width: 100%;
			display: inline-block;
			margin: 0 !important;
	}

	a.search-suggestions-link {
			grid-template-rows: auto;
			grid-template-columns: .25fr 1fr;
			padding: 5px;
			grid-row-gap: 20px;
			grid-column-gap: 20px;
			grid-auto-columns: 1fr;
			justify-content: center;
			display: grid !important;
	}

	.search-suggestions-image-container {
			flex-direction: column;
			display: flex;
			justify-content: center;
			align-items: center;
			margin: auto;
			height: 65px !important;
	}

	img.search-suggest-image {
			max-height: 65px;
			margin-left: auto;
			margin-right: auto;
			padding: 0 !important;
	}

	.search-suggestions-text {
			flex-direction: column;
			display: flex !important;
			justify-content: center;
			align-items: flex-start;
			text-align: left;
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
			font-size: 15px !important;
			line-height: 17px !important;
	}

	.js-search-suggestions-all-link.search-suggestions-all-link {
			font-family: Elmssans Variablefont Wght, Verdana, sans-serif;
			font-size: 17px;
			text-decoration: none;
			font-weight: 600;
	}

</style>