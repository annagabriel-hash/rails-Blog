class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    # Temporary assign a user to prevent error
    @article.user = User.find(2)
    if @article.save
      redirect_to @article, notice: 'Article was created successfully'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was deleted successfully'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])    
  end

  def article_params
    params.require(:article).permit(:name, :body, :image_url)
  end
end
