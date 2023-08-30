class RegistrationsController < ApplicationController
  def create
    if user.persisted?
      session[:user_id] = user.id

      render json: { status: :created, user: user.to_api.serializable_hash }
    elsif user.errors.any?
      render json: { status: 500 }
    else
      render json: { status: 500 }
    end
  end

  def user
    @user ||= User.create(
      first_name: params["firstName"],
      last_name: params["lastName"],
      email: params["email"],
      password: params["password"],
      password_confirmation: params["passwordConfirmation"],
      username: params["userName"],
    )
  end
end
