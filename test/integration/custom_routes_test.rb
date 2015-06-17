require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /entrar route opens the login page" do 
  	get '/entrar'
  	assert_response :success
  end
end
