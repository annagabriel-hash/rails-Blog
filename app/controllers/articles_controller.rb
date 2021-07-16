class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
  end

  def edit
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
    if @article.update()
      flash[:notice] = 'Article was update successfully'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])    
  end

end
