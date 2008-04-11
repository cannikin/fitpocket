require File.dirname(__FILE__) + '/../test_helper'
require 'workouts_controller'

# Re-raise errors caught by the controller.
class WorkoutsController; def rescue_action(e) raise e end; end

class WorkoutsControllerTest < Test::Unit::TestCase
  def setup
    @controller = WorkoutsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
