class Database
  include Inesita::Component

  def render
    randomize!
    tr do
      td class: 'dbname' do
        props
      end
      td class: 'query-count' do
        span class: "label #{class_name}"do
          @count
        end
      end
      5.times do
        component Query
      end
    end
  end

  def randomize!(range = 0..10)
    @count = rand(range)
  end

  def class_name
    case @count
    when 0..9 then 'label-success'
    else 'label-warning'
    end
  end
end
