class ResultsController < ApplicationController
  def index

    # (1) Create a blank array and push all the IDs of the current user's friends into it.

    recipient_ids = Array.new

    all_friends = Friend.all
    @list_of_friends = all_friends

    @list_of_friends.each do |a_friend|
      if @current_user.id == a_friend.sender_id
        recipient_ids.push(a_friend.recipient_id)
      end
    end

    # (2) For each friend, pluck out the IDs of all the courses they like and push them into a new array.
    
    @matching_course_ids = Array.new
      recipient_ids.each do |a_recipient|
        @matching_course_ids << User.where({ :id => a_recipient }).at(0).likes.pluck(:course_id)
      end
    
    # (3) Flatten the array, group by course, and store the result in a hash where key = course id and value = likes that course id received (for purposes of later counting how many there are stored in each value).

    @matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v]}.to_h

    # (4) But I need to filter out those courses that the current user hasn't liked, so I need to pluck out current user liked course ID's.

    @current_user_course_ids = Array.new
    @current_user_course_ids << User.where({ :id => @current_user.id }).at(0).likes.pluck(:course_id)
    @current_user_course_ids = @current_user_course_ids.flatten

    # (5) And then I can use that to filter so eliminate courses that the current user hasn't liked.
    
    @overlapping_course_ids = @matching_course_ids.flatten & @current_user_course_ids

    # (6) Now I convert each key and value into the information I actually want to show the user, and I push them into a new has that will make it easy to print this information across two columns in a table.

    @printable_results = Hash.new
    @matching_hash.each do |k, v|
    if @overlapping_course_ids.include? k
    @printable_results.store(Course.where({ :id => k }).at(0).name,v.length)
    end
    end


    # (7) There we go. Now render the page that will show the resultst.

    render({ :template => "results/index.html.erb" })
    
  end
end