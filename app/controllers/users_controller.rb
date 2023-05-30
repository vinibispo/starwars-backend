# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    Users::Repo::Register
      .call(**user_params.to_h)
      .on_success { |result| render json: Serialize.call(result[:user], token: result[:token]), status: :created }
      .on_failure(:invalid) { |result| render json: {errors: result[:errors]}, status: :unprocessable_entity }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  Serialize = lambda do |user, token:|
    Users::Serializer.new(
      email: user.email,
      name: user.name,
      token:
    )
  end
end
