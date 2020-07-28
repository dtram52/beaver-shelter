require 'resque/tasks'
require "resque/scheduler/tasks"
task "resque:preload" => :environment

namespace :resque do
  task :setup_schedule => :setup do
    require 'resque-scheduler'

    # The schedule doesn't need to be stored in a YAML, it just needs to
    # be a hash.  YAML is usually the easiest.
    Resque.schedule = YAML.load_file('config/resque_schedule.yml')

    # If your schedule already has +queue+ set for each job, you don't
    # need to require your jobs.  This can be an advantage since it's
    # less code that resque-scheduler needs to know about. But in a small
    # project, it's usually easier to just include you job classes here.
    # So, something like this:
  end

  task :scheduler => :setup_schedule
end
