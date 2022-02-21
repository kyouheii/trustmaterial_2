require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV['RAILS_ENV'] || :development


set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every 1.day, at: ['9:00 am'] do
  rake 'push_line:push_line_message_morning'
end
# 以下のスケジュールを追加。
every 1.day, at: ['7:00 pm'] do
  rake 'push_line:push_line_message_night'
  
  
end