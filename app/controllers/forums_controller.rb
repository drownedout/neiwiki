class ForumsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_forum, only: [:show, :edit, :update, :destroy]
	
	def index
		@forums = Forum.all
	end

	def new
		@forum = current_user.forums.build 
	end

	def create
		@forum = current_user.forums.build(forum_params)

		if @forum.save
			redirect_to @forum
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @forum.update(forum_params)
			redirect_to @forum
		else
			render 'edit'
		end

	end

	def destroy
		@forum.destroy
		redirect_to forums_path
	end

	def search
	    if params[:search].present?
	      @forums = Forum.search(params[:search])
	    else
	      @forums = Forum.all
	    end
  	end

	private

	def find_forum
		@forum = Forum.find(params[:id])
	end

	def forum_params
		params.require(:forum).permit(:title, :content)
	end

end
