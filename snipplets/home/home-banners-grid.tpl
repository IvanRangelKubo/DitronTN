  <div class="secctwobanners">
    <div class="customcontainer">
      <div id="w-node-_32bc2d4d-9639-7dbb-e4fe-525327c58667-4ac40bd1" class="w-layout-layout stacktwo wf-layout-layout">

        {% for image in settings.banner %}
            <div class="w-layout-cell">
                <a href="{{ image.link }}" class="linksecondbanner w-inline-block">
                    <img src="{{ image.image | static_url }}"  alt="{{ image.title }}" class="bannersecundario">
                </a>
            </div> 
        {% endfor %}

      </div>
    </div>
  </div>