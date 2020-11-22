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
    
    # (d) Getting back to counting how many of the current user's friends liked each of these courses, flatten the array and store in a hash key value pairs where key = course id and value = instances of that course in the friends' likes.

    @matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v]}.to_h

        # (c) But I need to filter out those courses that the current user hasn't liked, so I need to get current user course ID's.

    @current_user_course_ids = Array.new
    @current_user_course_ids << User.where({ :id => @current_user.id }).at(0).likes.pluck(:course_id)
    @current_user_course_ids = @current_user_course_ids.flatten

    # (d) And so here's what I'm after. An array of the course IDs that the current user is intersted in and that at least one of their friends is intersted in.
    
    @overlapping_course_ids = @matching_course_ids.flatten & @current_user_course_ids

    # (d) Render the page that will show the resultst.

    render({ :template => "results/index.html.erb" })

  end
  
end