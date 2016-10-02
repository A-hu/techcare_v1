namespace :dev do

  task :fix_user_auth_token => :environment do
    User.find_each do |u|
      puts "Update #{u.id} token"
      u.generate_authentication_token
      u.save!
    end
  end

 end