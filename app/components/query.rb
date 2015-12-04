class Query
  include Inesita::Component

  def render
    td class: "Query elapsed #{class_name}" do
      text props[:time] && props[:time].round(2)
      div class: 'popover left' do
        div class: 'popover-content' do
          query
        end
        div class: 'arrow'
      end
    end
  end

  def query
    if props[:time]
      'SELECT * FROM inesita'
    else
      '<IDLE>'
    end
  end

  def class_name
    if props[:time].nil?
      :warn
    elsif props[:time] < 1
      :warn_short
    elsif props[:time] > 10
      :warn_long
    else
      :warn
    end
  end
end
