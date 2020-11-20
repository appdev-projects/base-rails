class UsersController < ApplicationController


  def index
    all_users = User.all
    @list_of_users = all_users.order({ :first_name => :desc })
    
    render({ :template => "users/index.html.erb" })
  end

  def show
    
  end
end


  def index
    matching_likes = Like.all

    @list_of_likes = matching_likes.order({ :created_at => :desc })

    render({ :template => "likes/index.html.erb" })
  end

