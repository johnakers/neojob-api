class UsersController < ApplicationController
  before_action :authorize!, only: [:show, :update, :destroy]

  def create
    user = User.create!(user_params)
    user.login!

    render json: current_user
  end

  def show
    render json: current_user
  end

  def update
    current_user.update!(user_params)

    render json: current_user
  end

  def destroy
    current_user.destroy

    head :no_content
  end

  private

  def user_params
    params.permit(:email, :password, :is_public, :goal_per_week)
  end
end
