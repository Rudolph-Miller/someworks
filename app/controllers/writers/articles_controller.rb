class Writers::ArticlesController < ApplicationController
  def index
		@articles = Article.all
  end

  def new
		@article = Article.new
  end

  def create
		article = Article.new(article_params)
		article.writer_id = 1
		if article.save!
			redirect_to writers_articles_path
		else
			redirect_to writers_articles_new_path
		end
  end

  def delete
  end

	def edit
	end

	def show
	end

	def update
	end

	private
	def article_params ()
		params.require(:article).permit(:id, :content, :created_at, :deleted_at, :updated_at, :assigned_task_id, :writer_id)
	end
end
