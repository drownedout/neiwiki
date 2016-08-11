class AnswersController < ApplicationController
	def create
		@forum = Forum.find(params[:forum_id])
		@answer = @forum.answers.create(params[:answer].permit(:name, :body))
		@answer.user_id = current_user.id
		if @answer.save
			respond_to do |format|
        		format.html { redirect_to forum_path(@forum) }
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

    	redirect_to forum_path(@forum)
	end
end
