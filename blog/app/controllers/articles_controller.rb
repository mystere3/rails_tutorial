class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to article_path(@article), notice: 'Article saved successfully'
    else
      flash[:alert] = "There was an error saving article"
      render :new
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Article updated successfully'
    else
      flash[:alert] = 'There was an error updating the article'
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path, notice: 'Article deleted successfully'
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text, :writer_id)
    end
  
end
