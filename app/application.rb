require 'inesita'

require_tree './components'

Inesita::Browser.ready? do
  app = DBMonster.mount_to(Inesita::Browser.body)
  r = proc do
    app.render!
    Inesita::Browser.animation_frame { r.call }
  end
  r.call
end
