namespace :cron do

  task :notify_set_schedules => :environment do
    Caregiver.weekly_notify
  end
  task :notify_schedules => :environment do
    Requester.weekly_notify
  end

end