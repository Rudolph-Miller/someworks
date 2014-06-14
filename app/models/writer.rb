class Writer < ActiveRecord::Base

	has_many :articles
	has_many :assigned_tasks

	validates :name, presence: true

	def create_article (params)
		@params = params
		article = Article.new(article_params)
		article.save
	end

	def update_article (params)
		@params = params
		article = Article.where(:id => params[:id]).first
		article.update_attributes(article_params)
		article.save
	end

	def delete_article (params)
		article = Article.where(:id => params[:id]).first
		article.deleted_at = Time.now
		article.save
	end

	private
	def article_params ()
		@params[:article][:writer_id] = 1
		@params.require(:article).permit(:content, :writer_id, :assigned_task_id, :created_at, :deleted_at, :updated_at)
	end
end
