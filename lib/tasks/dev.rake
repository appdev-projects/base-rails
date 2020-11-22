desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do


  User.detroy_all
Flight.destroy_all

u = User.new
u.email = "here"
u.password = "here"
u.save

p u.errors.full_messages

first_flight = Flight.new
first_flight.description = "here"
first_flight.departs_at = 24.hours.from_new + 5.min
first_flight.user_id = u.id
first_flight.save

p first_flight.errors.full_messages

end
