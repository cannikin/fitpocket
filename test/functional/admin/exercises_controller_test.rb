require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/exercises_controller'

# Re-raise errors caught by the controller.
class Admin::ExercisesController; def rescue_action(e) raise e end; end

class Admin::ExercisesControllerTest < Test::Unit::TestCase
  fixtures :exercises

  def setup
    @controller = Admin::ExercisesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = exercises(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:exercises)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:exercise)
    assert assigns(:exercise).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:exercise)
  end

  def test_create
    num_exercises = Exercise.count

    post :create, :exercise => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_exercises + 1, Exercise.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:exercise)
    assert assigns(:exercise).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Exercise.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Exercise.find(@first_id)
    }
  end
end
