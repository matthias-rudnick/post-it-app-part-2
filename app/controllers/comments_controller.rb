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



end