module BucketsHelper
  def count_bar_width(color, curr_budget, curr_reserved, available_pixels = 750)
    curr_budget += 1
    curr_reserved += 1
    min_width = 50
    
    red = available_pixels * (curr_reserved/curr_budget)
    if red < min_width
      red = min_width
    elsif available_pixels-red < min_width
      red = available_pixels - min_width
    end
    
    ret = case color
      when 'red'
        red
      else
        available_pixels - red
      end
      
    return ret.to_i
  end
end
