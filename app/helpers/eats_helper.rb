module EatsHelper
  
  def eat_image_tag(value)
      image_tag "/images/#{eat_image_name(value)}.png", :size => '18x22'
  end

  def eat_image_name(value)
      if value == true
        'thumbs_up'
      else 
        'thumbs_down'
      end
  end
  
  def special_type(value)
    if value == true
      ", Special Occasion"
    else 
      ""
    end
  end
end
