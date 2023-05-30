class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing

  private

  def render_parameter_missing(exception)
    render json: { errors: exception.message }, status: :bad_request
  end

  def authenticate_user
    Sessions::Repo::Authenticate
      .call(token: request.headers['Authorization'])
      .on_success do |user|
      @current_user = user
    end
      .on_failure(:invalid) do |result|
      render json: { errors: result[:errors] }, status: :unauthorized
    end
  end
end
