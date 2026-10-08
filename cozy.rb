module Cozy
  extend self

  module Files
    TASKS = "./tarefinhas_de_hoje.cozy"
  end

  module Actions
    LIST = "list"
    NEW = "new"
    COMPLETE = "complete"
    DELETE = "delete"

    ALL = constants.map { |c| const_get(c) }.freeze
  end

  module Marks
    DONE = "x"
    DONE_DISPLAY = "✅"
  end

  def insert_task(text)
    File.write Files::TASKS, "#{text}\n", mode: "a"
  end

  def display_all_tasks
    puts File.read(Files::TASKS).gsub(Marks::DONE, Marks::DONE_DISPLAY)
  end

  def display_help
    puts "Known actions: #{Actions::ALL}"
  end

  def run
    action = ARGV[0]

    case action
    when Actions::NEW
      insert_task(ARGV[1])
    when Actions::LIST
      display_all_tasks
    else
      display_help
    end
  end
end

Cozy::run
