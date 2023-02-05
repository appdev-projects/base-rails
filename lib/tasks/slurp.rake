namespace :slurp do
  desc "TODO"
  task seekers: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - seekers.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      s = Seeker.new
      s.email = row["email"]
      s.full_name = row["full_name"]
      s.password = row["password"]
      s.personal_score = row["personal_score"]
      s.communal_score = row["communal_score"]
      s.environmental_score = row["environmental_score"]
      s.transcendental_score = row["transcendental_score"]
      s.spiritual_type = row["spiritual_type"]
      s.active_course_id = row["active_course_id"]
      s.save

      puts "#{s.email}, #{s.full_name} saved"
    end
    puts "There are now #{Seeker.count} rows in the seekers table"
  end


  task practices: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - practices.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      pr = Practice.new
      pr.name = row["name"]
      pr.body_mind = row["body_mind"]
      pr.spoken_silent = row["spoken_silent"]
      pr.extemp_ritual = row["extemp_ritual"]
      pr.description = row["description"]
      pr.save

      puts "#{pr.name}, #{pr.description} saved"
    end
    puts "There are now #{Practice.count} rows in the Practices table"
  end

end
