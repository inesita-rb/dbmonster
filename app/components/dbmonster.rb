class DBMonster
  include Inesita::Component

  def initialize(rows=20)
    @rows = rows
  end

  def render
    table class: 'table table-striped latest-data' do
      tbody do
        @rows.times do |i|
          component Database, props: "cluster#{i}"
          component Database, props: "cluster#{i}slave"
        end
      end
    end
  end
end
