class PostsController < ApplicationController

before_filter :find_post, only: [:show, :edit]

before_filter :require_user, only: [:new, :edit, :create, :update]

  def index
  	@posts = Post.all
  end

  def new
    @post=Post.new
  end

  def create
  	@post = Post.create(params[:post])
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
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post), notice: "You successfully updated your post."
    else #validation failure
      render :edit
    end
	end

  protected    
  
  def find_post
    @post = Post.find(params[:id])
  end

end
