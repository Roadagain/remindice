require "remindice/version"
require "thor"

module Remindice
  TASK_FILENAME = File.expand_path("~/.remindice_tasks")

  class << self
    def tasks
      @@tasks.clone
    end

    def save(tasks)
      file = File.open(TASK_FILENAME, "w")
      tasks.each do |i|
        file.puts i
      end
    end
  end
  class Commands < Thor
    if File.exists?(Remindice::TASK_FILENAME)
      @@tasks = File.readlines(Remindice::TASK_FILENAME).map{|i| i.chomp}
    else
      @@tasks = []
    end

    desc 'add TASKS', 'Add tasks'
    def add(*task)
      task.each do |i|
        if @@tasks.include? i
          STDERR.puts "'#{i}' is already added"
        else
          @@tasks << i
          puts "'#{i}' is successfully added"
        end
      end
      Remindice.save @@tasks
    end

    option :all, :type => :boolean, :aliases => :a
    desc 'remove TASKS', 'Remove tasks'
    def remove(*task)
      if options[:all]
        clear
        return
      else
        task.each do |i|
          if @@tasks.include? i
            @@tasks.delete i
            puts "'#{i}' is successfully removed"
          else
            STDERR.puts "'#{i}' does not exist"
          end
        end
        Remindice.save @@tasks
      end
    end

    desc 'clear', 'Clear tasks'
    def clear
      Remindice.save []
      puts "Tasks are successfully cleared"
    end
  end
end
