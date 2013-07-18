#!/usr/bin/env ruby

APP_ROOT = "/home/deploy/apps/crowdstudio/current"

command = ARGV.first


def start
  system("cd #{APP_ROOT} ; RAILS_ENV=production bundle exec unicorn_rails -c #{APP_ROOT}/config/unicorn.rb -D -E production")
end

def stop
  pid = File.read("#{APP_ROOT}/tmp/pids/unicorn.crowdstudio.pid").to_i
  system("kill -s QUIT #{pid}") if pid != 0
end

def restart
  stop
  sleep 2
  start
end

case command
  when 'start' then start()
  when 'stop'  then stop()
  when 'restart' then restart()
  else
    puts "Usage #{$0} {start|stop|restart}"
end