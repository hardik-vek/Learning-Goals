class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = ::Article.all
    CallbackJob.set(wait: 15.seconds).perform_later('hello hardik')
    SidekiqJob.perform_at(10.seconds.from_now,'vekariya')
    LowJob.perform_async
    CriticalJob.perform_async
  end

  def show
    
  end

  def new
    @article = ::Article.new
  end

  def create 
    @article = Article.new(articles_params)
    if @article.save
      ArticleMailer.with(article: @article).delay( priority: 0).welcome_article # send a mail for delayed jobs
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
      ArticleMailer.with(article: @article).update_article.deliver_later # action mailer with default adapter
      # ArticleMailer.with(article: @article).delay.update_article # delayed jobs
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
        