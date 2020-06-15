class LogoController < ApplicationController
  def create
    @user = current_user
    @user.logo.attach(params[:logo])
    redirect_to(user_path(@user))
  end
end
