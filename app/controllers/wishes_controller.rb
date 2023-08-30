class WishesController < ApplicationController
  # This endpoint is used to create a new wish.
  # It's currently used on a user's profile page.
  def create
    if wish.save
      render json: { wish: wish.to_api.serializable_hash }
    else
      render json: { errors: wish.errors.full_messages }
    end
  end

  # This endpoint is used to update an existing wish.
  # It's currently used on a user's profile page.
  def update
    if wish
      update_wish

      render json: { status: :ok, wish: wish.reload }
    else
      head :not_found
    end
  end

  # This endpoint is used to destroy an existing wish.
  # It's currently used on a user's profile page.
  def destroy
    if wish
      wish.destroy!

      render json: { wish: nil }
    else
      head :not_found
    end
  end

  private

  def wish
    if params[:id].present?
      Wish.find_by(id: params[:id])
    else
      Wish.new(
        name: params[:name],
        price: params[:price],
        url: params[:productUrl],
        user_id: params[:userId],
        image: param_value_or_nil(params[:file]),
      )
    end
  end

  def update_wish
    if updating_image?
      wish.update!(
        image: param_value_or_nil(params[:file]),
        name: param_value_or_nil(params[:name]),
        price: param_value_or_nil(params[:price]),
        url: param_value_or_nil(params[:url]),
      )
    else
      wish.update!(
        name: param_value_or_nil(params[:name]),
        price: param_value_or_nil(params[:price]),
        url: param_value_or_nil(params[:url]),
      )
    end
  end

  def updating_image?
    params[:file].present?
  end

  def param_value_or_nil(value)
    return unless value.present? && value != "null"

    value
  end
end
