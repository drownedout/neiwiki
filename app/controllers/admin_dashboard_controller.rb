class AdminDashboardController < ApplicationController
	def index
		if admin_types.include?(current_user.type)
			@users = User.all
			@articles = Article.all
			@forums = Forum.all
			@categories = Category.all
			@flagged_comments = Comment.where(flagged: true)
			@flagged_answers = Answer.where(flagged: true)
		else
			redirect_to root_path
		end
	end
end
