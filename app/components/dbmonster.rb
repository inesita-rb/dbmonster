class DBMonster
  include Inesita::Component

  def initialize(rows=20)
    @rows = rows
  end

  def randomize(range = 0..10)
    rand(range)
  end

  def render
    table class: 'table table-striped latest-data' do
      tbody do
        @rows.times do |i|
          component Database, props: { name: "cluster#{i}", count: randomize }
          component Database, props: { name: "cluster#{i}slave", count: randomize }
        end
      end
    end
  end
end
