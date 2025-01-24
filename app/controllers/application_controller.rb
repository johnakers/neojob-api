class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  private

  def authorize!
    authenticate_or_request_with_http_basic do |email, session_id|
      user = User.find_by(email: email)

      return head :forbidden unless user
      return head :forbidden unless session_id
      return head :forbidden unless user.session.id == session_id

      @current_user ||= user
    end
  end

  def current_user
    @current_user
  end
end
