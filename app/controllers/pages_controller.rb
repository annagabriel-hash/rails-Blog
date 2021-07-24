class PagesController < ApplicationController
  def home
    @articles = Article.all.take(3)
  end
end
