require 'charts/BinaryChart'

module SiteHelper
  def binary_chart(name, data, background_color='f0f0f0', positive_color='00ff00', negative_color='ff0000', size='600x100')
    if (data == nil)
      return "<i>No results yet.</i>"
    end
    url = BinaryChart.new(name, data, background_color, positive_color, negative_color, size).get_chart()
    if(url != nil)
      raw "<img src=\"" + url + "\" alt=\"chart\" class=\"chart\"/>"
    else
      raw "<i>No results yet.</i>"
    end
  end

end
