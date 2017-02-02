class AnswersController < ApplicationController
	def create
		@forum = Forum.find(params[:forum_id])
		@answer = @forum.answers.create(params[:answer].permit(:name, :body))
		@answer.user_id = current_user.id
		if @answer.save
			respond_to do |format|
        		format.html { redirect_to forum_path(@forum), notice: "Your response was successfully created" }
        		format.js 
    		end
		else
			flash.now = "error"
		end
	end

	def destroy
		@forum = Forum.find(params[:forum_id])
		@answer = @forum.answers.find(params[:id])
    	@answer.destroy

    	redirect_to forum_path(@forum), notice: "Your response was successfully deleted"
	end

	def flagged
		@forum = Forum.find(params[:forum_id])
		@answer = @forum.answers.find(params[:id])
		@answer.update_attribute(:flagged, true)
		@answer.save
		redirect_to @forum
	end

	def unflag
		@forum = Forum.find(params[:forum_id])
		@answer = @forum.answers.find(params[:id])
		@answer.update_attribute(:flagged, false)
		@answer.save
		redirect_to @forum
	end
end
