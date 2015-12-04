require 'inesita'

require_tree './components'


$document.ready do
  app = DBMonster.new.mount_to($document.body)
  r = proc do
    app.render!
    animation_frame { r.call }
  end
  r.call
end
