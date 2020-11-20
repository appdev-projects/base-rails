class ResultsController < ApplicationController
  def index
    
    render({ :template => "results/index.html.erb" })
  end
  
end