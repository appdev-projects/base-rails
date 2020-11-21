class ResultsController < ApplicationController
  def index

    # WORKFLOW:
    #  1. Who are the current user's friends?
    #  2. What courses do those friends like? I can't write an associate to get this because those tables aren't linked.
    #  3. For each course the current user has liked, count the number of their friends who have liked each of those courses. Be careful not to include the current user when calculating the number of likes.
    #  4. Store the course names and number of likes into an object, then print the results into a table.

    # (a) Create a blank array and push all the IDs of the current user's friends into it.
    recipient_ids = Array.new

    all_friends = Friend.all
    @list_of_friends = all_friends

    @list_of_friends.each do |a_friend|
      if @current_user.id == a_friend.sender_id
        recipient_ids.push(a_friend.recipient_id)
      end
    end

    # (b) For each friend, pluck out the IDs of all the courses they have liked and push it into a new array.
    
    @matching_course_ids = Array.new
      recipient_ids.each do |a_recipient|
        @matching_course_ids << User.where({ :id => a_recipient }).at(0).likes.pluck(:course_id)
      end
    
    # (c) Flatten the array and store in a hash key value pairs where key = course id and value = instances of that course in the friends' likes.

    @matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v]}.to_h

    # (d) Render the page that will show the resultst.

    render({ :template => "results/index.html.erb" })

  end

  def unused_code
    
    # (b) For each of those friends, push into an array an array of the courses that they have liked. Then iterate through those sub-arrays to strip out the ID of eacch course a friend has liked and push those into a new array.
    
    friends_courses = Array.new
    friends_courses_ids = Array.new

    recipient_ids.each do |an_id|
      friends_courses.push(User.where({ :id => an_id }).at(0).courses)
      friends_courses.each do |a_course|
        friends_courses_ids.push(a_course.at(0).id)
    end
    end

  end
  
end