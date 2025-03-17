components {
  id: "light_script_2"
  component: "/background/light_script_2.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"light\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_MULT\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/main.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 3.0
    y: 3.0
  }
}
