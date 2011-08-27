# -*- coding: utf-8 -*-
require 'rubygems'
#require 'google_chart'

require 'gchart'
class BinaryChart

  @checks
  @title
  @background_color
  @positive_color
  @negative_color
  @size
  
  def initialize(title, checks, background_color, positive_color, negative_color, size)
    @checks = checks
    @title = title
    @background_color = background_color
    @positive_color = positive_color
    @negative_color = negative_color
    @size = size
  end
  
  def get_chart()
    RAILS_DEFAULT_LOGGER.debug("Generating binary chart with checks: #{@checks}")
    values = get_results(@checks)
   # dates = clean_repeating_values(get_dates(@checks))
    dates = get_dates(@checks)
    get_chart_url(values, dates)
  end

  def get_chart_url(values, dates)
    if(values.length == 0)
      return nil
    end
    Gchart.bar(:data => [values, revert_results(values)],
               :bar_colors => [@positive_color, @negative_color],
               :axis_with_labels => 'x',
               :axis_labels => dates ? dates : [""],
               :background => @background_color,
               :size => @size)
  end

  
  
  def clean_repeating_values(coll)
    (coll.uniq.map do |el|
       [el].concat(Array.new( coll.count(el) - 1, ''))
     end).flatten
  end
  
  def get_dates(checks)
    checks.map do |check|
      check.created_at.strftime("%d.%m")
    end
  end

  def get_results(checks)
    checks.map do |check|
      check.result == :ok ? 1 : 0
    end
  end
  
  def revert_results(results)
    results.map do |result|
      result == 1 ? 0 : 1
    end
  end
      
end
