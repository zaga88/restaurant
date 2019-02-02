class ApplicationController < ActionController::API
  include Knock::Authenticable

  protected

  def json_error_response(message, errors, status = :unauthorized)
    errors_obj = { message: message }.merge(details: errors)
    render json: { success: false, message: message, errors: errors_obj }, status: status
  end
end
