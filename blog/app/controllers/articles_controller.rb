class ArticlesController < ApplicationController
  
  before_action :authorize, except: [:index, :show]

  def index
    @articles = Article.all
  end
  
  def show

    @article = Article.find(params[:id])
        # binding.pry
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def create
    binding.pry
    @article = Article.new(article_params)
    @article.writer_id = current_writer.id
    
    if @article.save
      redirect_to article_path(@article), notice: 'Article saved successfully'
    else
      flash[:alert] = "There was an error saving article"
      render :new
    end
  end
  
  def update
    binding.pry
    @article = Article.find_by_id(params[:id])
    
    if @article.update_attributes(article_params)
      redirect_to article_path(@article), notice: 'Article updated successfully'
    else
      flash[:alert] = 'There was an error updating the article'
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path, notice: 'Article deleted successfully'
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text, :writer_id, :tag_ids => [])
    end
  
end
