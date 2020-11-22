class FriendsController < ApplicationController
  def index
    matching_friends = Friend.all

    @list_of_friends = matching_friends.order({ :created_at => :desc })

    render({ :template => "friends/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friends = Friend.where({ :id => the_id })

    @the_friend = matching_friends.at(0)

    render({ :template => "friends/show.html.erb" })
  end

  def create
    the_friend = Friend.new
    the_friend.sender_id = @current_user.id
    the_friend.recipient_id = params.fetch("query_recipient_id")

    if the_friend.valid?
      the_friend.save
      redirect_to("/users", { :notice => "Friend created successfully." })
    else
      redirect_to("/users", { :notice => "Friend failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_friend = Friend.where({ :id => the_id }).at(0)

    the_friend.user_id = params.fetch("query_user_id")

    if the_friend.valid?
      the_friend.save
      redirect_to("/friends/#{the_friend.id}", { :notice => "Friend updated successfully."} )
    else
      redirect_to("/friends/#{the_friend.id}", { :alert => "Friend failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friend = Friend.where({ :id => the_id }).at(0)

    the_friend.destroy

    redirect_to("/users", { :notice => "Friend deleted successfully."} )
  end
end
