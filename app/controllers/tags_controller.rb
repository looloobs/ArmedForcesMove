class TagsController < ApplicationController
  def show
      @installation = Installation.find(params[:installation_id])
      @tag = Tag.find(params[:id])
      @title = "Links Tagged With '#{@tag.name}'"
      @questions = @tag.taggings.collect { |t| t.taggable }
      render(:template => 'questions/index')
    end
end
