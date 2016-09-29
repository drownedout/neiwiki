class AdminDashboardController < ApplicationController
	def index
		if admin_types.include?(current_user.type)
			@users = User.all
			@articles = Article.all
			@forums = Forum.all
			@categories = Category.all
		else
			redirect_to root_path
		end
	end
end
