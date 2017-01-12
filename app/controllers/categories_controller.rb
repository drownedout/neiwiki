class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all.order("name ASC").group_by{|u| u.name[0]}
	end

	def new
		@category = Category.new
		
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to root_path, notice: "Category was created successfully"
		else
			render 'new'
		end
		
	end

	def show
		@category_articles = @category.articles
	end

	def edit
		
	end

	def update
		if @category.update(category_params)
			redirect_to root_path, notice: "Category was updated successfully"
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def category_params
		params.require(:category).permit(:name, :description)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end
