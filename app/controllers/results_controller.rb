class ResultsController < ApplicationController
  def index
    
    #friends_id = Array.new
    @sender_ids = Friend.where("sender_id = ? or recipient_id = ?", @current_user.id, @current_user.id ).pluck(:sender_id)
    @recipient_ids = Friend.where("sender_id = ? or recipient_id = ?", @current_user.id, @current_user.id ).pluck(:recipient_id)

    render({ :template => "results/index.html.erb" })

# Command .Pluck will just pull out all the values from a single key: will create an array with just those numbers inside of it

# Move stuff to controller

# Array with just friend’s ids: then query the courses table with that…once I have those courses, I can do a count where ID is this in that active record relation

# I want to pass that ID
# Query likes table by IDs of friends and return all of courses they like
# Loop through those courses and do a where method on that table with the course_id and see all the records that are liked by my friends
# Chain where’s on there
# All records and second .where by the course and count that

# First where query whole likes table by friend ids
# Second where query records returned by the course ID inside of my loop

  end
  

  
  def friend_likes
    # Go through all the listings in the Friend table and pull out those where the sender_id is the same as the current user's id and push those into an array

    users_friends = Array.new

    all_friends = Friend.all
    @list_of_friends = all_friends.order({ :first_name => :desc })

    @list_of_friends.each do |a_friend|
      if @current_user.id == a_friend.sender_id
        users_friends.push(a_friend)
      end
    end

    # Extract the recipient_id from each of those friends so I can match those users with the user table

    recipient_ids = Array.new

    users_friends.each do |a_friend|
      recipient_ids.push(a_friend.recipient_id)
    end

    # Match the recipient ids with the users
    
    recipient_user_records = Array.new

    recipient_ids.each do |a_recipient|
      recipient_user_records.push(User.where({ :id => recipient_ids }))
    end

    # Now I've got an array with the user_id for all of the current_user friends...so now let's get all the courses those friends liked

    friends_liked_courses = Array.new

    recipient_user_records.at(0).each do |a_user|
      friends_liked_courses.push(a_user.courses)
    end

    # ...and this friends_liked_courses array is what's currently being used to populate the table with course names below.

    # Now I need to count the number of times each course was liked...so first I'll push the ID of each course above into an array...

    friends_liked_courses_ids = Array.new
    
    friends_liked_courses.each do |a_liked_course|
      friends_liked_courses_ids.push(a_liked_course.at(0).id)
    end

    # ...and then i'll count how many times each ID occurs in the array...

    # not sure how to do this

  %>

  <!-- but the above friends_like_courses_ids array is only capturing the first class in each friend's array of courses -->


  friends_id = Array.new
  Friend.where("sender_id = ? or recipient_id = ?", @current_user.id, @current_user.id ).pluck(:sender_id)
  Friend.where("sender_id = ? or recipient_id = ?", @current_user.id, @current_user.id ).pluck(:recipient_id)
  end
end