class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  def new
    @user = User.new
    @user.build_player
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email_address,
      :password,
      :password_confirmation,
      player_attributes: [:name, :avatar_url]
    )
  end
end
