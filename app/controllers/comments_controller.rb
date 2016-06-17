class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params[:comment].permit(:name, :body))
		@comment.user_id = current_user.id
		if @comment.save
			respond_to do |format|
        		format.html { redirect_to article_path(@article) }
        		format.js 
    		end
		else
			flash.now = "error"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
    	@comment.destroy

    	redirect_to article_path(@article)
	end

end
