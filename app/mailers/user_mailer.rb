class UserMailer < ApplicationMailer
  default from: 'moufaca755@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://monka-project.herokuapp.com'
    mail(to: @user.email, subject: 'Bienvenue chez Monka !')
  end

end