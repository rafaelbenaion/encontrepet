require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should be redirect when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
   sign_in users(:jason) 
   get :new
   assert_response :success
  end

  test "should be log to post" do
    post :create, posts: { about: "euasdasdasd", age: "teste", animal: "teste", gender: "teste", name: "teste", size: "teste" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create post wen logg" do
    sign_in users(:jason) 
    
    assert_difference('Post.count') do
      post :create, post: { about: @post.about, age: @post.age, animal: @post.animal, gender: @post.gender, name: @post.name, size: @post.size }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { about: @post.about, age: @post.age, animal: @post.animal, gender: @post.gender, name: @post.name, size: @post.size }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
