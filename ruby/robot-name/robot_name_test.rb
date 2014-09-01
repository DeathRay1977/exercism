require 'minitest/autorun'
require_relative 'robot'

class RobotTest < MiniTest::Unit::TestCase
  def test_has_name
    assert_match /\w{2}\d{3}/, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    assert Robot.new.name != Robot.new.name
  end

  def test_reset_name
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
    assert_match /\w{2}\d{3}/, name2
  end

  def test_name_recorded_in_list_of_all_robots
    robot = Robot.new
    name = robot.name
    searched_name = Robot.search(name)
    assert searched_name != nil
  end

  def test_count_of_robots_is_incremented_when_robot_created
    count = Robot.count
    Robot.new
    assert Robot.count == count+1
  end

  def test_count_is_correct_for_multiple_creation
    count = Robot.count
    100.times {Robot.new}
    assert Robot.count == count+100
  end

  def test_count_of_robots_is_same_after_robot_name_change
    robot = Robot.new
    count = Robot.count
    robot.reset
    assert Robot.count == count
  end

  def test_unknown_name_not_recorded_in_list_of_all_robots
    robot = Robot.new
    name = robot.name
    assert Robot.search("ZZ000") == nil
  end

  def test_robots_old_name_not_in_list_of_robots_after_reset
    robot = Robot.new
    name = robot.name
    robot.reset
    assert Robot.search(name) == nil
  end

end
