class ArticlesController < ApplicationController
	
	def index 
		@articles = Article.all
	end


	def new 
		@article = Article.new
	end 


	def show
		@article = Article.find(params[:id])
		#here view's name will be same if you want to change.. You should use render

	end

	def edit
		@article = Article.find(params[:id])
	end


	def create 
		@article = Article.new(articles_params)

		if @article.save  #@article is an instant object#returns true if there were no errors saving the article 
			redirect_to articles_path
		else
			render 'new'
		end 
		# puts paramas render :text 	
		#render plain: params[:article].inspect
	end

	
	def update
 		 @article = Article.find(params[:id])
  		if @article.update(articles_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path 
	end
	private
		def articles_params
		 params.require(:article).permit(:title, :text)
		end
end
