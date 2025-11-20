  <div class="seccbloghome">
    <div class="customcontainer">
      <div id="w-node-cace86b5-746a-78d0-393d-7d51659a36cb-4ac40bd1" class="w-layout-layout stack2col wf-layout-layout">

        <div class="w-layout-cell cellintroblog">
					<img src="{{ "blog_image.jpg" | static_url }}"  alt="{{ settings.blog_image_alt }}" class="imgtitleblog">
          <p class="homesecctext white">{{ settings.blog_description }}</p>
          <a href="{{ settings.blog_url }}" class="verblogbtn w-button">{{ settings.blog_label }}</a>
        </div>

        <div class="w-layout-cell">
          <div data-delay="4000" data-animation="slide" class="blogslder w-slider" data-autoplay="false" data-easing="ease" data-hide-arrows="false" data-disable-swipe="false" data-autoplay-limit="0" data-nav-spacing="3" data-duration="500" data-infinite="true">

            <div class="blogmask w-slider-mask">

							{% if settings.show_article_1 %}
								<div class="blogslide w-slide">
									<div id="w-node-fcf3f54d-df55-ff02-2384-2f1e562388a7-4ac40bd1" class="w-layout-layout miniblog wf-layout-layout">

										<div class="w-layout-cell">
											<div class="imgcontslider" style="background-image: url({{ "article_image_1.jpg" | static_url }})" ></div>
										</div>

										<div class="w-layout-cell">
											<div class="infobloghome">
												<div class="contitlecust">
													<h6 class="homeblogtitle">{{ settings.article_1_title }}</h6>
													<div class="linetitle"></div>
												</div>
												<p class="excerptblog">{{ settings.article_1_description }}</p>
												<a href="{{ settings.article_1_url}}" class="readmore">Leer más</a>
											</div>
										</div>

									</div>
								</div>
							{% endif %}

							{% if settings.show_article_2 %}
								<div class="blogslide w-slide">
									<div id="w-node-fcf3f54d-df55-ff02-2384-2f1e562388a7-4ac40bd1" class="w-layout-layout miniblog wf-layout-layout">

										<div class="w-layout-cell">
											<div class="imgcontslider" style="background-image: url({{ "article_image_2.jpg" | static_url }})" ></div>
										</div>

										<div class="w-layout-cell">
											<div class="infobloghome">
												<div class="contitlecust">
													<h6 class="homeblogtitle">{{ settings.article_2_title }}</h6>
													<div class="linetitle"></div>
												</div>
												<p class="excerptblog">{{ settings.article_2_description }}</p>
												<a href="{{ settings.article_2_url}}" class="readmore">Leer más</a>
											</div>
										</div>

									</div>
								</div>
							{% endif %}

							{% if settings.show_article_3 %}
								<div class="blogslide w-slide">
									<div id="w-node-fcf3f54d-df55-ff02-2384-2f1e562388a7-4ac40bd1" class="w-layout-layout miniblog wf-layout-layout">

										<div class="w-layout-cell">
											<div class="imgcontslider" style="background-image: url({{ "article_image_3.jpg" | static_url }})" ></div>
										</div>

										<div class="w-layout-cell">
											<div class="infobloghome">
												<div class="contitlecust">
													<h6 class="homeblogtitle">{{ settings.article_3_title }}</h6>
													<div class="linetitle"></div>
												</div>
												<p class="excerptblog">{{ settings.article_3_description }}</p>
												<a href="{{ settings.article_3_url}}" class="readmore">Leer más</a>
											</div>
										</div>

									</div>
								</div>
							{% endif %}

							{% if settings.show_article_4 %}
								<div class="blogslide w-slide">
									<div id="w-node-fcf3f54d-df55-ff02-2384-2f1e562388a7-4ac40bd1" class="w-layout-layout miniblog wf-layout-layout">

										<div class="w-layout-cell">
											<div class="imgcontslider" style="background-image: url({{ "article_image_4.jpg" | static_url }})" ></div>
										</div>

										<div class="w-layout-cell">
											<div class="infobloghome">
												<div class="contitlecust">
													<h6 class="homeblogtitle">{{ settings.article_4_title }}</h6>
													<div class="linetitle"></div>
												</div>
												<p class="excerptblog">{{ settings.article_4_description }}</p>
												<a href="{{ settings.article_4_url}}" class="readmore">Leer más</a>
											</div>
										</div>

									</div>
								</div>
							{% endif %}

            </div>

            <div class="sliderarrow white w-slider-arrow-left">
              <div class="w-icon-slider-left"></div>
            </div>
            <div class="sliderarrow white w-slider-arrow-right">
              <div class="w-icon-slider-right"></div>
            </div>
            <div class="hiddenslidenav blog w-slider-nav w-round"></div>

          </div>
        </div>

      </div>
    </div>
  </div>