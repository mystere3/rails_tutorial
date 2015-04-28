class TagsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @tag = @article.tags.create(tag_params)
    redirect_to article_path(@article)
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end