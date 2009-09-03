# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  
  def clickable_tag_list(tag_list)
      out = []
      tag_list.each do |tag|
        out << link_to(tag.name, installation_tag_path(@installation,tag))
      end
      out.join(', ')
    end
  


  def display_stars(stars)
    
    content_tag :div, star_images(stars), :class => 'stars'
  end
  
  def star_images(stars)
    (0...5).map do |n|
      star_image_tag(((stars-n)*2).round)
    end.join
  end
  
  def star_image_tag(value)
    image_tag "/images/ratings/#{star_image_name(value)}.png", :size => '20x20'
  end
  
  def star_image_name(value)
    if value <= 0
      'grey_bubble'
    elsif value == 1
      'small_half_star'
    else
      'red_bubble'
    end
  end



def rank_image_tag(value)
    image_tag "/images/ratings/#{rank_image_name(value)}.png", :size => '35x35'
end

def rank_image_name(value)
    if value == 1
      'red_one_bubble'
    elsif value == 2
      'red_two_bubble'
    elsif value == 3
      'red_three_bubble'
    elsif value == 4
      'red_four_bubble'
    elsif value == 5
      'red_five_bubble'
    else 
      'grey_empty_bubble'
    end


  end
  
  
end
