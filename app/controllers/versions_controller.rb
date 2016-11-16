class VersionsController < ApplicationController
	def index
		@versions = PaperTrail::Version.page(params[:page]).per(20).order("created_at DESC")
	end

	def show
		@version = PaperTrail::Version.find(params[:id])
	end
end