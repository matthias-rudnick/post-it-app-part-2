class CommentsController < ApplicationController

before_filter :require_user 
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])
		@comment.user_id = current_user.id

  	if @comment.save
  		redirect_to post_path(@post), notice: "Comment was successfully created."
  	else #validation failure
  		render '/posts/show'
  	end
  end

  def vote
    @comment = Comment.find(params[:id])
    @comment.votes.create(vote: params[:vote], user: current_user)
    respond_to do |format|
      format.html do
        redirect_to :back, notice: "Your vote was counted."
      end
      format.js
    end
  end



end