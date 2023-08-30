class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :first_name,
    :last_name,
    :username,
    :avatar_url,
    :wishes,
  )

  def avatar_url
    object.avatar.url
  end

  def wishes
    object.wishes.map do |wish|
      wish.to_api.serializable_hash
    end
  end
end
