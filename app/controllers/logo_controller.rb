class LogoController < ApplicationController

  def create
    @user = current_user

    if params[:logo]
      @user.logo.attach(params[:logo])

      flash[:success] = "Votre logo a bien été enregistré"
    else
      flash[:error] = "Veuillez mettre un logo avant de soumettre le formulaire"
    end

    redirect_to(user_path(@user))
  end
end
