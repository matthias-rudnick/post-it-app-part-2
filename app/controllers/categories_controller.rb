class CategoriesController < ApplicationController

before_filter :require_user, except: [:show]
	def new
		@category = Category.new
	end

	def create
		@category = Category.create(params[:category])

		if @category.save
			redirect_to root_path, notice: 'Category has been created.'
		else
			render :new
		end

	end


	def show
		@category = Category.find(params[:id])
		@posts = @category.posts
	end

end
