class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = ::Article.all
  end

  def show
  end

  def new
    @article = ::Article.new
  end

  def create 
    @article = Article.new(articles_params)
    if @article.save
      ArticleMailer.with(article: @article).delay.welcome_article # send a mail
      TestDelayedJob.new.perform # just dummy method
      flash[:notice] = 'Article created successfully'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(articles_params)
      ArticleMailer.with(article: @article).delay.update_article
      flash[:notice] = 'Article updated successfully'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy 
    @article.destroy
    redirect_to articles_path
  end
  
  private

  def find_article
    @article = ::Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title,:description)
  end
end
