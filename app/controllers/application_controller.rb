class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing

  private

  def render_parameter_missing(exception)
    render json: { errors: exception.message }, status: :bad_request
  end
end
