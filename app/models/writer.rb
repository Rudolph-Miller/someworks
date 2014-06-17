class Writer < ActiveRecord::Base

	has_many :articles
	has_many :assigned_tasks

	validates :name, presence: true

	def create_article (params)
		@params = params
		article = Article.new(article_params)
		article.save
		tokens = params[:tokens]
		unless tokens.nil?
			tokens.split(",").each do |token|
				lst = token.split(":")
				token1 = lst[0]
				token2 = lst[1]
				picture = Picture.where(:token1 => token1, :token2 => token2).first
				unless picture.nil?
					picture.article_id = article.id
					picture.save
				end
			end
		end
	end

	def update_article (params)
		@params = params
		article = Article.where(:id => params[:id]).first
		article.update_attributes(article_params)
		article.save
		tokens = params[:tokens]
		unless tokens.nil?
			tokens.split(",").each do |token|
				lst = token.split(":")
				token1 = lst[0]
				token2 = lst[1]
				picture = Picture.where(:token1 => token1, :token2 => token2).first
				unless picture.nil?
					picture.article_id = article.id
					picture.save
				end
			end
		end
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
