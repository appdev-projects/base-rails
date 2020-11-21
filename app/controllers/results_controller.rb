class ResultsController < ApplicationController
  def index

    users_friends = Array.new

    all_friends = Friend.all
    @list_of_friends = all_friends

    @list_of_friends.each do |a_friend|
      if @current_user.id == a_friend.sender_id
        users_friends.push(a_friend)
      end
    end

    # Extract the recipient_id from each of those friends so I can match those users with the user table

    @recipient_ids = Array.new

    users_friends.each do |a_friend|
      @recipient_ids.push(a_friend.recipient_id)
    end


    
    @friends_courses = Array.new
    @friends_courses_ids = Array.new

    @recipient_ids.each do |an_id|
      @friends_courses.push(User.where({ :id => an_id }).at(0).courses)
      @friends_courses.each do |a_course|
        @friends_courses_ids.push(a_course.at(0).id)
      end
    end

@matching_course_ids = Array.new
    @recipient_ids.each do |a_recipient|
      @matching_course_ids << User.where({ :id => a_recipient }).at(0).likes.pluck(:course_id)
    end

# matching_course_ids
matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h

# delete this instance variable if i don't end up using it
@matching_hash = @matching_course_ids.flatten.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h


# fetching hash
@match_counts = matching_hash.map { |k,v| "#{Course.where({ :id => k }).at(0).name}} is liked by #{v} of your friends!" }


@match_counts_k = matching_hash.map { |k,v| "#{Course.where({ :id => k }).at(0).name}" }
@match_counts_v = matching_hash.map { |k,v| "#{v}" }


    render({ :template => "results/index.html.erb" })

  end
  
end