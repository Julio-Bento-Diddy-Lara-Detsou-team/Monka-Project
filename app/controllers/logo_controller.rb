class LogoController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.logo.attach(params[:logo])
    redirect_to(user_path(@user))
  end
end
