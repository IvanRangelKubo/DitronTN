{% if home_main_product %}
	{% set has_multiple_slides = product.media_count > 1 %}
{% else %}
	{% set has_multiple_slides = product.media_count > 1 or product.video_url %}
{% endif %}

{# armamos la URL "real" de la imagen destacada #}
{% set featured_url = product.featured_image | product_image_url('original') %}
{# en TN, cuando no hay imagen, la URL incluye "no-photo" #}
{% set has_real_image = featured_url and ('no-photo' not in featured_url) %}

<div class="row vipImg" data-store="product-image-{{ product.id }}"> 

	{% if product.media_count > 0 %}
		<div class="col px-3">
			<div class="js-swiper-product swiper-container product-detail-slider" data-product-images-amount="{{ product.media_count }}">
               
				<div class="swiper-wrapper">
					{% for media in product.media %}
						{% if media.isImage %}
							<div class="js-product-slide w-100 swiper-slide product-slide{% if home_main_product %}-small{% endif %} slider-slide" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
								{% if home_main_product %}
									<div class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
								{% else %}
									<a href="{{ media | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
								{% endif %}
									
									{% set apply_lazy_load = home_main_product or not loop.first %}

									{% if apply_lazy_load %}
										{% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
									{% else %}
										{% set product_image_src = media | product_image_url('large') %}
									{% endif %}

									{% if product.images_count > 0 and has_real_image %}
										<img 
										{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
										{% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
										{% if apply_lazy_load %}data-{% endif %}srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w, {{  media | product_image_url('original') }} 1024w' 
										class="js-product-slide-img product-slider-image img-absolute img-absolute-centered {% if apply_lazy_load %}lazyautosizes lazyload{% endif %}" 
										{% if apply_lazy_load %}data-sizes="auto"{% endif %}
										{% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
										{% if media.alt %}alt="{{media.alt}}"{% endif %} />
									{% else %}
										<img src="{{ 'images/ditron placeholder.webp' | static_url }}" class="placeholderVip" alt="{{ product.name }}">
									{% endif %}
								{% if home_main_product %}
									</div>
								{% else %}
									</a>
								{% endif %}
							</div>
						{% else %}
							{% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true, home_main_product: home_main_product, media: media} %}
						{% endif %}
					{% endfor %}
					{% if not home_main_product %}
						{% include 'snipplets/product/product-video.tpl' with {video_id: 'yt'} %}
					{% endif %}
				</div>
			</div>
			{% if has_multiple_slides %}
				<div class="row no-gutters my-1 text-center align-items-center d-md-none">
					<div class="js-swiper-product-prev col-auto swiper-button-small swiper-button-prev svg-icon-text mt-0">
						<svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
					</div>
					<div class="js-swiper-product-pagination col swiper-pagination-fraction font-small"></div>
					<div class="js-swiper-product-next col-auto swiper-button-small swiper-button-next svg-icon-text mt-0">
						<svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
					</div>
				</div>
			{% endif %}

			{% if has_multiple_slides %}
					<div class="product-thumbs-horizontal mt-3">

							<div class="product-thumbs-scroll">
									<div class="thumbs-row">
											{% for media in product.media %}
													<div class="swiper-slide thumb-slide">
															{% include 'snipplets/product/product-image-thumbs.tpl' %}
													</div>
											{% endfor %}
											{% if not home_main_product %}
													<div class="swiper-slide thumb-slide">
															{% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
													</div>
											{% endif %}
									</div>
							</div>

							<div class="thumbs-pagination text-center mt-2">
									<div class="js-swiper-thumbs-prev swiper-button-small swiper-button-prev">
											<svg class="icon-inline icon-sm"><use xlink:href="#chevron"/></svg>
									</div>
									<div class="js-swiper-thumbs-next swiper-button-small swiper-button-next">
											<svg class="icon-inline icon-sm"><use xlink:href="#chevron"/></svg>
									</div>
							</div>
					</div>
			{% endif %}

		</div>
	{% endif %}

</div>

<style>
	/* Contenedor horizontal */
	.product-thumbs-horizontal {
			width: 100%;
			max-width: 600px;
			margin: auto;
	}

	/* Swiper horizontal */
	.swiper-container-horizontal {
			width: 100%;
			overflow: hidden;
			height: 600px !important;
	}

	/* Cada thumbnail */
	.thumb-slide {
			width: 15% !important;
			height: auto !important;
			flex-shrink: 0;
	}

	/* Ajustes de imagen dentro del thumb */
	.thumb-slide img {
			object-fit: cover;
			border-radius: 6px;
	}

	/* Flechas */
	.thumbs-pagination {
			display: flex;
			justify-content: center;
			align-items: center;
			gap: 20px;
	}

	.thumbs-pagination .swiper-button-small {
			cursor: pointer;
	}
	
	.product-thumbs-horizontal .swiper-wrapper {
    display: flex !important;
    flex-direction: row !important;
		gap: 15px;
}

	.product-thumbs-scroll {
		overflow-x: auto;
		white-space: nowrap;
		padding-bottom: 10px;
		scrollbar-width: thin;
	}

	.thumbs-row {
		display: flex;
		gap: 12px;
	}

	.thumb-slide {
		width: 80px;
		flex: 0 0 auto;
	}

	.js-swiper-thumbs-prev.swiper-button-small.swiper-button-prev {
		transform: rotate(180deg) !important;
	}

	.product-thumbs-scroll {
			overflow-x: auto;
			white-space: nowrap;
			padding-bottom: 10px;
			scrollbar-width: thin;

			scroll-snap-type: x mandatory;
			scroll-behavior: smooth;
	}

	.thumb-slide {
			width: 80px; /* o el ancho que necesites */
			flex: 0 0 auto;
			scroll-snap-align: start;
	}


</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const container = document.querySelector('.product-thumbs-scroll');
  const prev = document.querySelector('.js-swiper-thumbs-prev');
  const next = document.querySelector('.js-swiper-thumbs-next');

  if (container && prev && next) {
    const getStep = () => {
      const firstThumb = container.querySelector('.thumb-slide');
      if (!firstThumb) return 150;
      
      const style = window.getComputedStyle(firstThumb);
      const marginRight = parseInt(style.marginRight) || 0;
      return firstThumb.offsetWidth + marginRight;
    };

    prev.addEventListener('click', () => {
      container.scrollBy({ left: -getStep(), behavior: 'smooth' });
    });

    next.addEventListener('click', () => {
      container.scrollBy({ left: getStep(), behavior: 'smooth' });
    });
  }
});

</script>
