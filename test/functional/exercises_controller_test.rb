require File.dirname(__FILE__) + '/../test_helper'
require 'exercises_controller'

# Re-raise errors caught by the controller.
class ExercisesController; def rescue_action(e) raise e end; end

class ExercisesControllerTest < Test::Unit::TestCase
  def setup
    @controller = ExercisesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
