class ProfilesController < ApplicationController
  def show
    if user_signed_in?
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user)
    end
  	@user = User.find_by_profile_name(params[:id])
  	if @user 
  		@losts = @user.losts.all
  		@posts = @user.posts.all

  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
