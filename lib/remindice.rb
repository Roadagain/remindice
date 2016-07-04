require "remindice/version"
require "thor"

module Remindice
  TASK_FILENAME = File.expand_path("~/.reamindice_tasks")

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
    @@tasks = if File.exists?(Remindice::TASK_FILENAME); File.readlines(Remindice::TASK_FILENAME) else [] end

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
  end
end
