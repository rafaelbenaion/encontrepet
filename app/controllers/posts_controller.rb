class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  

  # GET /posts
  # GET /posts.json
  def index
  if user_signed_in?
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user)
  end
  # @posts = Post.order('created_at desc').all 
  @posts = Post.where(nil).order("created_at DESC") # creates an anonymous scope
  filtering_params(params).each do |key, value|
  @posts = @posts.public_send(key, value) if value.present?
  end
end

def filtering_params(params)
  params.slice(:tamanho, :animal, :gender, :starts_with, :castrado, :vacinado, :cidade)
end
 

  # GET /posts/1
  # GET /posts/1.json
  def show
     @meta = { title: 'Meu nome é '+@post.name.downcase.capitalize+', me adote!', description: @post.about+'. Por Encontrepet.com', image: 'http://encontrepet.com'+@post.photo.url(:thumb), type: 'article' }
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
    
    #@post.build_documentet
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Doação criada com sucesso.'
      else
        render :new
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = current_user.posts.find(params[:id])
    if params[:post] && params[:post].has_key?(:user_id)
      params[:post].delete(:user_id)
    end 
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Doação editada com sucesso.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Doação deletada com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:image, :search_query, :sorted_by, :with_country_id, :with_created_at_gte, :celular, :telefone, :castrado, :vacinado, :cidade, :user_id, :name, :age, :animal, :gender, :size, :about, :image_file_name, :image_fields, :build_image, :remove_image)
    end
end
