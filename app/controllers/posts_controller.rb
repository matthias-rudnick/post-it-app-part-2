class PostsController < ApplicationController

before_filter :find_post, only: [:show, :edit, :vote]

before_filter :require_user, only: [:new, :edit, :create, :update]

  def index
  	@posts = Post.all
  end

  def new
    @post=Post.new
    @categories_array = Category.all.map{ |category| [category.name, category.id]}
  end

  def create
  	@post = Post.create(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to '/', notice: "Post was successfully created."
  	else #validation failure
      render :new
  	end
	end

	def show
		@comment = Comment.new
	end

  def edit

  end

	def update 
		@post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice: "You successfully updated your post."
    else #validation failure
      render :edit
    end
	end

  def vote
    @post.votes.create(vote: params[:vote], user: current_user)
    respond_to do |format|
      format.html do
        redirect_to :back, notice: "Your vote was counted."
      end
      format.js
    end
  end

  protected    
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_ids =>[])
  end

end
