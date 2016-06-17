class PagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@categories = Category.order("created_at DESC").all.limit(6)
		@articles = Article.order("created_at DESC").all.limit(6)
	end

	def profile
	end

end