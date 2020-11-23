desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

# Users

if ActiveRecord::Base.connection.table_exists?("users")
    User.delete_all

    users = [
      {id: 1, email: "galen@example.com", first_name: "Galen", last_name: "Smith", created_at: "2015-01-19 09:24:34", updated_at: "2019-10-08 10:25:00"},
      {id: 2, email: "trina@example.com", first_name: "Trina", last_name: "Davis", created_at: "2014-09-02 06:05:56", updated_at: "2019-10-08 10:25:00"},
      {id: 3, email: "tyree@example.com", first_name: "Tyree", last_name: "Taylor", created_at: "2017-06-23 22:31:32", updated_at: "2019-10-08 10:25:00"},
      {id: 4, email: "sharilyn@example.com", first_name: "Sharilyn", last_name: "Johnson", created_at: "2014-09-23 01:03:23", updated_at: "2019-10-08 10:25:00"},
      {id: 5, email: "judith@example.com", first_name: "Judith", last_name: "Moore", created_at: "2014-08-02 12:55:21", updated_at: "2019-10-08 10:25:00"},
      {id: 6, email: "roscoe@example.com", first_name: "Roscoe", last_name: "Wilson", created_at: "2018-03-05 07:37:08", updated_at: "2019-10-08 10:25:00"},
      {id: 7, email: "thad@example.com", first_name: "Thad", last_name: "Jones", created_at: "2015-05-29 04:13:06", updated_at: "2019-10-08 10:25:00"},
      {id: 8, email: "vanetta@example.com", first_name: "Vanetta", last_name: "Patel", created_at: "2017-11-07 09:36:41", updated_at: "2019-10-08 10:25:00"},
      {id: 9, email: "jackie@example.com", first_name: "Jackie", last_name: "Williams", created_at: "2016-10-28 00:47:57", updated_at: "2019-10-08 10:25:00"},
      {id: 10, email: "lucius@example.com", first_name: "Lucius", last_name: "Brown", created_at: "2014-06-15 07:42:16", updated_at: "2019-10-08 10:25:00"}
    ]
    User.insert_all!(users)
    if User.method_defined?(:password) || User.has_attribute?(:password_digest)
      User.find_each do |user|
        user.password = "password"
        user.save
      end
      puts "Found a password column. Added passwords."
    else
      # puts "No password column found. Didn't add passwords."
    end
    puts "There are #{User.count} users in the database"
  else
    puts "There is no Users table"
  end


# Courses

  if ActiveRecord::Base.connection.table_exists?("courses")
    Course.delete_all
    course_values = [
      {:id=>1, :name=>"Marketing Strategy", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"4"},
      {:id=>2, :name=>"Application Development", :group_work=>"Not much", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"0"},
      {:id=>3, :name=>"Taxes & Business Strategy", :group_work=>"Typical", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"4"},
      {:id=>4, :name=>"Big Data", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"5"},
      {:id=>5, :name=>"Machine Learning", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"5"},
      {:id=>6, :name=>"Data Analysis in R & Python", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"3"},
      {:id=>7, :name=>"Competitive Strategy", :group_work=>"Typical", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"3"},
      {:id=>8, :name=>"Managerial Decision Modeling", :group_work=>"Typical", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"4"},
      {:id=>9, :name=>"Operations Management", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"2"},
      {:id=>10, :name=>"Microeconomics", :group_work=>"Not much", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"2"},
      {:id=>11, :name=>"Accounting", :group_work=>"Not much", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"2"},
      {:id=>12, :name=>"Regression Analysis", :group_work=>"A lot", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :group_size=>"5"}
    ]
    Course.insert_all!(course_values)
    puts "Courses have been entered into the database"
  else
    puts "There's no Courses table"
  end

#Friends

if ActiveRecord::Base.connection.table_exists?("friends")
    Friend.delete_all
    friend_values = [
      {:id=>1, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"10"},
      {:id=>2, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"9"},
      {:id=>3, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"8"},
      {:id=>4, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"7"},
      {:id=>5, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"6"},
      {:id=>6, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"1", :recipient_id=>"5"},
      {:id=>7, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"4"},
      {:id=>8, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"3"},
      {:id=>9, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"1"},
      {:id=>10, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"10"},
      {:id=>11, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"9"},
      {:id=>12, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"2", :recipient_id=>"8"},
      {:id=>13, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"7"},
      {:id=>14, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"6"},
      {:id=>15, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"5"},
      {:id=>16, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"4"},
      {:id=>17, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"2"},
      {:id=>18, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"3", :recipient_id=>"1"},
      {:id=>19, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"10"},
      {:id=>20, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"9"},
      {:id=>21, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"8"},
      {:id=>22, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"7"},
      {:id=>23, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"6"},
      {:id=>24, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"4", :recipient_id=>"5"},
      {:id=>25, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"5", :recipient_id=>"4"},
      {:id=>26, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"5", :recipient_id=>"3"},
      {:id=>27, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"5", :recipient_id=>"2"},
      {:id=>28, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"5", :recipient_id=>"1"},
      {:id=>29, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"5", :recipient_id=>"10"},
      {:id=>30, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"9"},
      {:id=>31, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"8"},
      {:id=>32, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"7"},
      {:id=>33, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"5"},
      {:id=>34, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"4"},
      {:id=>35, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"6", :recipient_id=>"3"},
      {:id=>36, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"2"},
      {:id=>37, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"1"},
      {:id=>38, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"10"},
      {:id=>39, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"9"},
      {:id=>40, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"8"},
      {:id=>41, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"6"},
      {:id=>42, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"7", :recipient_id=>"5"},
      {:id=>43, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"4"},
      {:id=>44, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"3"},
      {:id=>45, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"2"},
      {:id=>46, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"1"},
      {:id=>47, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"10"},
      {:id=>48, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"8", :recipient_id=>"9"},
      {:id=>49, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"8"},
      {:id=>50, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"7"},
      {:id=>51, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"6"},
      {:id=>52, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"5"},
      {:id=>53, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"4"},
      {:id=>54, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"9", :recipient_id=>"3"},
      {:id=>55, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"2"},
      {:id=>56, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"1"},
      {:id=>57, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"9"},
      {:id=>58, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"8"},
      {:id=>59, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"7"},
      {:id=>60, :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11", :sender_id=>"10", :recipient_id=>"6"}
    ]
    Friend.insert_all!(friend_values)
    puts "Friends have been entered into the database"
  else
    puts "There's no Friends table"
  end


#Likes

if ActiveRecord::Base.connection.table_exists?("likes")
    Like.delete_all
    like_values = [
      {:id=>1, :course_id=>"1", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"},
      {:id=>2, :course_id=>"2", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>3, :course_id=>"3", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>4, :course_id=>"4", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>5, :course_id=>"5", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>6, :course_id=>"6", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>7, :course_id=>"7", :user_id=>"1", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>8, :course_id=>"8", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>9, :course_id=>"9", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>10, :course_id=>"10", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>11, :course_id=>"11", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>12, :course_id=>"12", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>13, :course_id=>"1", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>14, :course_id=>"2", :user_id=>"2", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>15, :course_id=>"3", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>16, :course_id=>"4", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>17, :course_id=>"5", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>18, :course_id=>"6", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>19, :course_id=>"7", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>20, :course_id=>"8", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>21, :course_id=>"9", :user_id=>"3", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>22, :course_id=>"10", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>23, :course_id=>"11", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>24, :course_id=>"12", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>25, :course_id=>"1", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>26, :course_id=>"2", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>27, :course_id=>"3", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>28, :course_id=>"4", :user_id=>"4", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>29, :course_id=>"5", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>30, :course_id=>"6", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>31, :course_id=>"7", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>32, :course_id=>"8", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>33, :course_id=>"9", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>34, :course_id=>"10", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>35, :course_id=>"11", :user_id=>"5", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>36, :course_id=>"12", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>37, :course_id=>"1", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>38, :course_id=>"2", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>39, :course_id=>"3", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>40, :course_id=>"4", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>41, :course_id=>"5", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>42, :course_id=>"6", :user_id=>"6", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>43, :course_id=>"7", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>44, :course_id=>"8", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>45, :course_id=>"9", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>46, :course_id=>"10", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>47, :course_id=>"11", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>48, :course_id=>"12", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>49, :course_id=>"1", :user_id=>"7", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>50, :course_id=>"2", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>51, :course_id=>"3", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>52, :course_id=>"4", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>53, :course_id=>"5", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>54, :course_id=>"6", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>55, :course_id=>"7", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>56, :course_id=>"8", :user_id=>"8", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>57, :course_id=>"9", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>58, :course_id=>"10", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>59, :course_id=>"11", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>60, :course_id=>"12", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>61, :course_id=>"1", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>62, :course_id=>"2", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>63, :course_id=>"3", :user_id=>"9", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>64, :course_id=>"4", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>65, :course_id=>"5", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>66, :course_id=>"6", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>67, :course_id=>"7", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>68, :course_id=>"8", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>69, :course_id=>"9", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>70, :course_id=>"10", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}, 
      {:id=>71, :course_id=>"11", :user_id=>"10", :created_at=>"2015-08-12 17:20:11", :updated_at=>"2015-08-12 17:20:11"}
    ]
    Like.insert_all!(like_values)
    puts "Likes have been entered into the database"
  else
    puts "There's no Likes table"
  end

end
