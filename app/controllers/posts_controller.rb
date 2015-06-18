class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  

  # GET /posts
  # GET /posts.json
  def index
  @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
  @conversations = Conversation.involving(current_user).order("created_at DESC")
  # @posts = Post.order('created_at desc').all 
  @posts = Post.where(nil) # creates an anonymous scope
  filtering_params(params).each do |key, value|
    @posts = @posts.public_send(key, value) if value.present?
  end
end

def filtering_params(params)
  params.slice(:tamanho, :animal, :gender, :starts_with, :castrado, :vacinado)
end
 

  # GET /posts/1
  # GET /posts/1.json
  def show
    
  @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
  @conversations = Conversation.involving(current_user).order("created_at DESC")

  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
    
    @post.build_documentet
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Doação criada com sucesso.'}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = current_user.posts.find(params[:id])
    @documentet = @post.documentet
    if params[:post] && params[:post].has_key?(:user_id)
      params[:post].delete(:user_id)
    end 
    respond_to do |format|
      if @post.update(post_params) &&
        @documentet && @documentet.update(post_params[:documentet_attributes])
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
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Doação deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:search_query, :sorted_by, :with_country_id, :with_created_at_gte, :celular, :telefone, :castrado, :vacinado, :cidade, :user_id, :name, :age, :animal, :gender, :size, :about, documentet_attributes: [:attachmentet, :documentet, :attachmentet_file_name, :documentet_fields, :build_documentet, :remove_attachmentet]) if params[:post]
    end
end