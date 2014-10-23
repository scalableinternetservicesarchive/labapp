require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "unauthenticated should fail create/edit/new/update" do
     [[:get, :new, {}],
      [:get, :edit, {id: @comment}],
      [:post, :create, {comment: @comment.attributes}],
      [:patch, :create, {comment: @comment.attributes}]].each do |method, action, kwargs|
      send(method, action, **kwargs)
      assert_redirected_to :new_user_session
    end
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create comment" do
    sign_in users(:one)
    assert_difference('Comment.count') do
      post :create, comment: @comment.attributes
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    sign_in users(:one)
    patch :update, id: @comment, comment: { message: 'Updated message'}
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
