require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "that posts reqires" do
	  post = Post.new
	  assert !post.save
	  assert !post.errors[:about].empty?
	end
    

    test "deve ter um user id" do
    	post = Post.new
    	post.about = "Hello"
    	assert !post.save
    	assert !post.errors[:user_id].empty?
    end

end
