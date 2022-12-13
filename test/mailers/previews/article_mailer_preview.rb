# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  def welcome_email
    ArticleMailer.with(article: Article.first).welcome_email
  end
end
