class ArticleMailer < ApplicationMailer

  def welcome_article
    @article = params[:article]
    mail(to: 'hardikvekariya218@gmail.com', subject: 'article has been created a successfully')
  end

  def update_article
    @article = params[:article]
    mail(to: 'hardikvekariya218@gmail.com', subject: 'article has been updated a successfully')
  end
end
