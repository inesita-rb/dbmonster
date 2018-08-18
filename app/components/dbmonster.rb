class DBMonster
  include Inesita::Component

  def initialize(rows=20)
    @rows = rows
  end

  def randomize(range = 0..10)
    rand(range)
  end

  def render
    table.table_striped.latest_data class: 'table' do
      tbody do
        @rows.times do |i|
          component Database, props: { name: "cluster#{i}", count: randomize }
          component Database, props: { name: "cluster#{i}slave", count: randomize }
        end
      end
    end
  end
end
