class SessionsController < ApplicationController
  include CurrentUserConcern
  include ActiveStorage::SetCurrent

  def create
    if user
      session[:user_id] = user.id

      render json: { status: :created, logged_in: true, user: user.to_api.serializable_hash }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: { status: :ok, logged_in: true, user: @current_user&.to_api&.serializable_hash }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session

    render json: { status: :ok, logged_out: true }
  end

  private

  def user
    @user ||= User.find_by(email: params[:email]).try(:authenticate, params[:password])
  end
end
