class HomeController < ApplicationController 
  
def index
@installation = Installation.search(params[:search])
end

end