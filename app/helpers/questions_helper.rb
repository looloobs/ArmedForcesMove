module QuestionsHelper
  def question_tag_links(question)
    return "" unless question.tag_list.any?
    tag_links = question.tag_list.collect do |tag|
      link_to tag, :controller => 'questions', :action => 'tag', :id => tag
    end
    tag_string = tag_link.join(', ')
    "(" + tag_string + ")" 
  end
  
end
