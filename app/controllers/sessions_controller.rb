# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    Sessions::Repo::Create
      .call(**session_params)
      .on_success { |result| render json: Serialize.call(result[:user], token: result[:token]), status: :created }
      .on_failure(:invalid) { |result| render json: { error: result[:error] }, status: :unauthorized }
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  Serialize = lambda do |user, token:|
    Users::Serializer.new(
      email: user.email,
      token:,
      name: user.name
    )
  end
end
