class Writer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :articles
	has_many :assigned_tasks

	validates :name, presence: true

	def create_article (params)
		@params = params
		article = Article.new(article_params)
    unless article.assigned_task_id.nil?
      article.title = article.task_title
    end
    p article
    article.writer_id = self.id
    article.status = 'writing'
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
		@params.require(:article).permit(:content, :writer_id, :assigned_task_id, :created_at, :deleted_at, :updated_at, :title)
	end
end
