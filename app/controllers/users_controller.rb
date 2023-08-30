class UsersController < ApplicationController
  include ActiveStorage::SetCurrent

  # This endpoint is used to fetch a user's information.
  # It's currently used on a user's profile page.
  def show
    if user
      render json: @user.to_api.serializable_hash
    else
      head :not_found
    end
  end

  # This endpoint is use to update a user's avatar image.
  # It's currently used on a user's profile page.
  def update
    if user
      @user.update!(avatar: params[:file])

      render json: { avatarUrl: url_for(@user.avatar) }
    else
      head :not_found
    end
  end

  private

  def user
    @user ||= User.find_by(username: params[:id])
  end
end
