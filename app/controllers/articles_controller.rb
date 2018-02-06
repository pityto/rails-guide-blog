class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update]

  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  def new
    #这里定义@article，为了避免在调用@article.errors.any?时@article的值为nil而抛出错误
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
