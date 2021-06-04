desc "Hydrate the database with some sample data to look at so that developing is easier"
task sample_data: :environment do
  starting = Time.now

  User.delete_all

  people = Array.new(10) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    }
  end

  people << { first_name: "Alice", last_name: "Smith" }
  people << { first_name: "Bob", last_name: "Smith" }
  people << { first_name: "Carol", last_name: "Smith" }
  people << { first_name: "Doug", last_name: "Smith" }

  people.each do |person|
    username = person.fetch(:first_name).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      name: "#{person[:first_name]} #{person[:last_name]}",
      private: [true, false].sample,
    )

    p user.errors.full_messages
  end
  
  
  users = User.all

  users.each do |user|
    rand(5).times do
      arcade = user.own_arcades.create(
        name: Faker::Business,
        address: Faker::Address
      )

      p arcade.errors.full_messages

        # user.followers.each do |follower|
        #   if rand < 0.5
        #     photo.fans << follower
        #   end

        #   if rand < 0.25
        #     comment = photo.comments.create(
        #       body: Faker::Quote.jack_handey,
        #       author: follower
        #     )

        #     p comment.errors.full_messages
        #   end
        # end
    end
  end

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Arcade.count} arcades."


  
end  
