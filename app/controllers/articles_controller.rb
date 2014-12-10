class ArticlesController < ApplicationController

  before_action :get_article, only: [:edit, :update, :destroy, :show]

  def get_article
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    render :new
  end

  def index
    @articles = Article.all
    render :index
  end

  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path  
  end

  def show
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
