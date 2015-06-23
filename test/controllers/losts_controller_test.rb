require 'test_helper'

class LostsControllerTest < ActionController::TestCase
  setup do
    @lost = losts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:losts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lost" do
    assert_difference('Lost.count') do
      post :create, lost: { about: @lost.about, animal: @lost.animal, another_phone: @lost.another_phone, bairro: @lost.bairro, city: @lost.city, date: @lost.date, gender: @lost.gender, name: @lost.name, phone: @lost.phone, size: @lost.size }
    end

    assert_redirected_to lost_path(assigns(:lost))
  end

  test "should show lost" do
    get :show, id: @lost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lost
    assert_response :success
  end

  test "should update lost" do
    patch :update, id: @lost, lost: { about: @lost.about, animal: @lost.animal, another_phone: @lost.another_phone, bairro: @lost.bairro, city: @lost.city, date: @lost.date, gender: @lost.gender, name: @lost.name, phone: @lost.phone, size: @lost.size }
    assert_redirected_to lost_path(assigns(:lost))
  end

  test "should destroy lost" do
    assert_difference('Lost.count', -1) do
      delete :destroy, id: @lost
    end

    assert_redirected_to losts_path
  end
end
