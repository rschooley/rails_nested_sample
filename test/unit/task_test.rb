require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "can't destroy if not named 'no'" do
    Task.delete_all
    task = Task.create(name: "yes")
    task.destroy

    assert Task.count == 0
  end

  test "can't destroy if named 'no'" do
    Task.delete_all
    task = Task.create(name: "no")
    task.destroy

    assert Task.count == 1
  end
end
