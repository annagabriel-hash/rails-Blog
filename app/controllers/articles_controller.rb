class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:name, :body))
    if @article.save
      flash[:notice] = 'Article was created successfully'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:name, :body))
      flash[:notice] = 'Article was update successfully'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

end
