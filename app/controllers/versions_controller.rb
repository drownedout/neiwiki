class VersionsController < ApplicationController
	def index
		@versions = PaperTrail::Version.page(params[:page]).per(20).order("created_at DESC")
	end
end