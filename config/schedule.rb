# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# every :saturday, :at => '8am' do # Use any day of the week or :weekend, :weekday
#   runner "Caregiver.weekly_notify"
# end

# every :sunday, :at => '8am' do # Use any day of the week or :weekend, :weekday
#   runner "Requester.weekly_notify"
# end

# every 1.minute  do # Use any day of the week or :weekend, :weekday
#   runner "Requester.weekly_notify"
# end

every :saturday, :at => '8am'  do 
  rake "cron:notify_set_schedules" 
end

every :sunday, :at => '8am'  do 
  rake "cron:notify_schedules"
end



# Learn more: http://github.com/javan/whenever
