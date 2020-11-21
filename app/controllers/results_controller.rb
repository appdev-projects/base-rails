class ResultsController < ApplicationController
  def index

    # WORKFLOW:
    #  1. Who are the current user's friends?
    #  2. What courses do those friends like? I can't write an associate to get this because those tables aren't linked.
    #  3. For each course the current user has liked, count the number of their friends who have liked each of those courses. Be careful not to include the current user when calculating the number of likes.
    #. 4. Store the course names and number of likes into an object, then print the results into a table.

    # LET'S BEGIN

    # 1. FIND THE CURRENT USER'S FRIENDS

    # (a) Create a blank array and push any friend record into it where the current user's id is the sender id.
    users_friends = Array.new

    all_friends = Friend.all
    @list_of_friends = all_friends

    @list_of_friends.each do |a_friend|
      if @current_user.id == a_friend.sender_id
        users_friends.push(a_friend)
      end
    end

    # (b) Extract the recipient id from each of those friend records and push them into a new array.

    recipient_ids = Array.new

    users_friends.each do |a_friend|
      recipient_ids.push(a_friend.recipient_id)
    end

    # (c) 
    
    friends_courses = Array.new
    friends_courses_ids = Array.new

    recipient_ids.each do |an_id|
      friends_courses.push(User.where({ :id => an_id }).at(0).courses)
      friends_courses.each do |a_course|
        friends_courses_ids.push(a_course.at(0).id)
      end
    end

@matching_course_ids = Array.new
    recipient_ids.each do |a_recipient|
      @matching_course_ids << User.where({ :id => a_recipient }).at(0).likes.pluck(:course_id)
    end

# matching_course_ids
matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h

# delete this instance variable if i don't end up using it
@matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h


    render({ :template => "results/index.html.erb" })

  end
  
end