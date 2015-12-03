class Query
  include Inesita::Component

  def render
    randomize!
    td class: "Query elapsed #{class_name}" do
      text @elapsed_time && @elapsed_time.round(2)
      div class: 'popover left' do
        div class: 'popover-content' do
          query
        end
        div class: 'arrow'
      end
    end
  end

  def randomize!
    @elapsed_time = rand > 0.1 ? rand * 15 : nil
  end

  def query
    if @elapsed_time
      'SELECT * FROM inesita'
    else
      '<IDLE>'
    end
  end

  def class_name
    case @elapsed_time
    when nil then :warn
    when 0..1 then :warn_short
    when 10..100 then :warn_long
    else :warn
    end
  end
end
