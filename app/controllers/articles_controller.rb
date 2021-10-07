class ArticlesController < ApplicationController 
  def show 
    @article = Article.find(params[:id])
  end 

  def index 
    @articles = Article.all 
  end

  def new 
    #for the first time it loads it has an empty @article to be sent into
    @article = Article.new
  end  

  def create 
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article has been saved."
    #redirect_to article_path(@article)
      redirect_to @article
    else 
      render 'new'
    end 
  end 
end