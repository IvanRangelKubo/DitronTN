<div class="seccacerca">
  <div class="customcontainer">
    <div id="w-node-_6b4feb0a-270f-2628-367a-af0c3d8b6d76-4ac40bd1" class="w-layout-layout stack2col wf-layout-layout">

      <div class="w-layout-cell cellintroblog">

        {% if "welcome_image.jpg" | has_custom_image %}
          <img 
            src="{{ "welcome_image.jpg" | static_url }}"  
            alt="{{ settings.welcome_text | default('') }}"
            class="imgtitleblog"
          >
        {% endif %}

        <p class="homesecctext">
          {{ settings.welcome_text | raw }}
        </p>

        {% if settings.welcome_button_label and settings.welcome_link %}
          <a 
            href="{{ settings.welcome_link | setting_url }}" 
            class="verblogbtn w-button"
          >
            {{ settings.welcome_button_label }}
          </a>
        {% endif %}

      </div>

      <div class="w-layout-cell"></div>

    </div>
  </div>
</div>

<style>
a:hover, a:focus {
    color: white !important;
}
</style>