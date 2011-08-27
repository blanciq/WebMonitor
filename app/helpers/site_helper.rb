require 'charts/BinaryChart'

module SiteHelper
  def binary_chart(name, data, background_color='f0f0f0', positive_color='00ff00', negative_color='ff0000', size='600x100')
    url = BinaryChart.new(name, data, background_color, positive_color, negative_color, size).get_chart()
    raw "<img src=\"" + url + "\" alt=\"chart\" class=\"chart\"/>"
  end

end
