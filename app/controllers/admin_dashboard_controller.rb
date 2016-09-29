class AdminDashboardController < ApplicationController
	def index
		@users = User.all
		@articles = Article.all
		@forums = Forum.all
		@categories = Category.all
	end
end
