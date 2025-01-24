class SessionsController < ApplicationController
  before_action :authorize!, only: [:destroy]

  def create
    user = User.find_by(email: session_params[:email])

    # bcrypt auth goes here
    if user&.password == session_params[:password]
      user.login!
      render json: user.session
    else
      head :forbidden
    end
  end

  def destroy
    user.session.destroy

    head :no_content
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
