class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:terms]

	def home
		@forums = Forum.order("created_at DESC").all.limit(6)
		@articles = Article.order("created_at DESC").all.limit(6)
	end

	def profile
	end

end