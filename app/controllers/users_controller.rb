
class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(params.require(:user).permit(
        :first_name,
        :last_name,
        :company_name,
        :address,
        :zip_code,
        :phone_number,
        :company_id
        )
    )
    redirect_to user_path(@user)
  end
end