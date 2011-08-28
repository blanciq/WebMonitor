# -*- coding: utf-8 -*-
require 'rubygems'

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
    dates = clean_repeating_values(get_dates(@checks))
    #dates = get_dates(@checks)
    RAILS_DEFAULT_LOGGER.debug("Generating binary chart with dates: #{dates}")
    get_chart_url(values, dates)
  end

  def get_chart_url(values, dates)
    if(values.length == 0)
      return nil
    end
    create_google_charts_url(values, dates)
  end

  def create_google_charts_url(values, labels)
    data = values.join(",")
    reversed_data = revert_results(values).join(",")
    x_labels = "|" + labels.join("|")
    base_url="https://chart.googleapis.com/chart?"
    base_url << "&chs=#{@size}"
    base_url << "&cht=bvs"
    base_url << "&chco=#{@positive_color},#{@negative_color}"
    base_url << "&chxt=x"
    base_url << "&chxl=0:#{x_labels}"
    base_url << "&chd=t:#{data}|#{reversed_data}"
    base_url << "&chds=0,1"
    base_url << "&chxs=0,,10,0,t"
    base_url
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
