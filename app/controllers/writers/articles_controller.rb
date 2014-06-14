class Writers::ArticlesController < ApplicationController
	
  def index
		@articles = Article.all
  end

  def new
		@article = Article.new
  end

  def create
		writer = Writer.new
		if writer.create_article(params)
			redirect_to writers_articles_path
		else
			redirect_to writers_articles_new_path
		end
  end

	def show
		@article = Article.where(:id => params[:id]).first
	end

	def edit
		@article = Article.where(:id => params[:id]).first
	end


	def update
		writer = Writer.new
		if writer.update_article(params)
			redirect_to writers_articles_path
		else
			 redirect_to writers_articles_edit_path
		end
	end

	def delete
		writer = Writer.new
		writer.delete_article(params)
		redirect_to writers_articles_path
	end
end
