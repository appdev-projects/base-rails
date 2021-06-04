desc "Hydrate the database with some sample data to look at so that developing is easier"
task sample_data: :environment do
  p "creating data"
  starting = Time.now

    Game.delete_all
    Arcade.delete_all
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
  
  games = Array.new(50) do
    {
      title: Faker::Game.title,
      release_date: Faker::Date.between(from: '1970-01-01', to: '2020-12-01'),
      description: Faker::Lorem.paragraph(
        sentence_count: 2,
        supplemental: true,
        random_sentences_to_add: 2
      )
    }
  end

  games.each do |game|

    game = Game.create(
      title: "#{game[:title]}",
      release_date: "#{game[:release_date]}",
      description: "#{game[:description]}",
    )

    p game.errors.full_messages
  end

  users = User.all

  users.each do |user|
    rand(2).times do
      arcade = user.own_arcades.create(
        name: Faker::Company.name,
        address: Faker::Address.full_address
      )
      p arcade.errors.full_messages
    end
  end

  




  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Arcade.count} arcades."
  p "There are now #{Game.count} games."

  
end  
