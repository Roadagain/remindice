require "remindice/version"
require "thor"

module Remindice
  TASK_FILENAME = "~/.reamindice_tasks"
  @@tasks = if File.exists?(TASK_FILENAME); File.readlines(TASK_FILENAME) else [] end
  class << self
    def tasks
      @@tasks.clone
    end
  end
  class Commands < Thor
  end
end
