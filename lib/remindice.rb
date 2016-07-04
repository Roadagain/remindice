require "remindice/version"
require "thor"

module Remindice
  TASK_FILENAME = File.expand_path("~/.reamindice_tasks")
  @@tasks = if File.exists?(TASK_FILENAME); File.readlines(TASK_FILENAME) else [] end
  class << self
    def tasks
      @@tasks.clone
    end

    def save
      file = File.open(TASK_FILENAME, "w")
      tasks.each do |i|
        file.puts i
      end
    end
  end
  class Commands < Thor
  end
end
