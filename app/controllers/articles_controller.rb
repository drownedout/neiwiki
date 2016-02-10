class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search]

	def index
		if params[:category].blank?
			@articles = Article.page(params[:page]).per(20).order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@articles = Article.where(category_id: @category_id).order("created_at DESC")
		end

	end

	def new

		@article = current_user.articles.build

	end

	def create

		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def search
	    if params[:search].present?
	      @articles = Article.search(params[:search])
	    else
	      @articles = Article.all
	    end
  	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :content, :category_id, :image, :document)
	end

	def find_article
		@article = Article.find(params[:id])
	end

end
