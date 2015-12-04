class Database
  include Inesita::Component

  def randomize
    rand > 0.1 ? rand * 15 : nil
  end

  def render
    tr do
      td class: 'dbname' do
        props[:name]
      end
      td class: 'query-count' do
        span class: "label #{class_name}"do
          props[:count]
        end
      end
      5.times do
        component Query, props: { time: randomize }
      end
    end
  end

  def class_name
    if props[:count] < 9
      'label-success'
    else
      'label-warning'
    end
  end
end
