class Writers::ArticlesController < Writers::ApplicationController
  def index
		@articles = current_writer.articles
    @tasks = Task.assigned_all
  end

  def new
    unless params[:assigned_task_id].nil?
      @article = Article.new(:assigned_task_id => params[:assigned_task_id])
    else
      @article = Article.new
    end
    p @article
  end

  def create
		if current_writer.create_article(params)
			redirect_to writers_articles_path
		else
			redirect_to (:back)
		end
  end

	def show
		@article = Article.where(:id => params[:id]).first
    unless @article.assigned_task_id.nil?
      @task = @article.assigned_task_info
    end
	end

	def edit
		@article = Article.where(:id => params[:id]).first
	end


	def update
		if current_writer.update_article(params)
			redirect_to writers_articles_show_path(:id => params[:id])
		else
			 redirect_to (:back)
		end
	end

	def delete
		current_writer.delete_article(params)
		redirect_to writers_articles_path
	end

	def upload_picture
		picture = Picture.new
		picture.image = File.open(params["image"].tempfile)
		picture.image_file_name = params[:"image"].original_filename
		picture.token1 = params[:token1].to_i
		picture.token2 = params[:token2].to_i
		if picture.save
			render :file, picture.image
		else
			render :file, picture.image 
		end
	end

	def show_image
		picture = Picture.where(:token1 => params[:token1].to_i, :token2 => params[:token2].to_i).first
		if picture.nil?
			render :file, "#{Rails.root}/public/images/sample/sample.png"
		else
			render :file, picture.image
		end
	end
end
