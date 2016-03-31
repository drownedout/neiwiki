class CategoriesController < ApplicationController
	before_action :find_category, only: [:edit, :update, :destroy]

	def new
		@category = Category.new
	end

	def update
		@category = Category.new
		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def category_params

	end

	def find_category
		@category = Category.find(params[:id])
	end

end
