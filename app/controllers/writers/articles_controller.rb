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
			redirect_to (:back)
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
			redirect_to writers_articles_show_path(:id => params[:id])
		else
			 redirect_to (:back)
		end
	end

	def delete
		writer = Writer.new
		writer.delete_article(params)
		redirect_to writers_articles_path
	end

	def upload_picture
		picture = Picture.new
		picture.image = File.open(params["image"].tempfile)
		picture.image_file_name = params[:"image"].original_filename
		picture.token1 = params[:token1].to_i
		picture.token2 = params[:token2].to_i
		p picture
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
