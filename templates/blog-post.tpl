  <div class="seccdetailblog">
    <div class="customcontainer">
      <div class="contentry">

        <div class="contitlecust">
          <div class="dateentryblog">{{ post.date|date("d/m/Y") }}</div>
          <h1 class="secctilte">{{ post.title }}</h1>
          <div class="linetitle"></div>
        </div>

        {{ component(
            'blog/blog-post-content', {
                image_lazy: true,
                image_lazy_js: true,
                post_content_classes: {
                    date: 'hidden',
                    image: 'imbentryblog',
                    content: 'contentry',
                },
            })
        }}

        <a href="/blog/" class="btnbackblog w-button">Volver al blog</a>      

      </div>
    </div>
  </div>


