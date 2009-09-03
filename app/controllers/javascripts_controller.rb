class JavascriptsController < ApplicationController
  # javascripts_controller.rb
  def dynamic_offposts
    @offposts = Offpost.find(:all)
  end


end
