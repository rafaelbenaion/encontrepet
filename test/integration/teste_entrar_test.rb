require 'test_helper'

class TesteEntrarTest < ActionDispatch::IntegrationTest

test "q o entrar funcione" do
   get '/entrar'
   assert_response :success

end

test "q o sair funcione" do
   get '/sair'
   assert_response :redirect
   assert_redirected_to '/'

end

test "q o cadastrar funcione" do
   get '/cadastrar'
   assert_response :success

end


end
