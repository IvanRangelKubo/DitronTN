<div class="seccdetailblog">
    <div class="customcontainer">
    
        <img src="{{ "blog_page_image.jpg" | static_url }}" class="logoblog">

        <div class="contitlecust">
            <h1 class="blogtitle">Bienvenido al <span class="destacadoblue">Blog de Ditron</span>: {{ settings.blog_page_description }}</h1>
        </div>
        
        <div class="listingposts">
            {% for post in blog.posts %}
                <div class="entrycont">
                    <div id="w-node-_9d6e34cb-82ae-b7fd-8747-d7b756bf7967-1c31681e" class="w-layout-layout stackentry wf-layout-layout">
                        <div class="w-layout-cell">
                            <div class="imgentrydiv" style="background-image: url('{{ post.thumbnail | default('/images/electrodomesticos.png' | static_url ) }}');" ></div>
                        </div>
                        <div class="w-layout-cell">
                            <div class="infominblog">
                            <div class="dateentryblog">{{ post.date | date("d/m/Y") }}</div>
                            <h3 class="titleentry">{{ post.title }}</h3>
                            <div class="linetitle"></div>
                            <p class="excerptlistingblog">{{ post.summary}}</p>
                            <a href="{{ shop.url }}/blog/posts/{{ post.handle }}" class="readmoreblog">Leer más</a>
                            </div>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>

    </div>
</div>
