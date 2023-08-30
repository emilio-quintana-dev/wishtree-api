class WishSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :price,
    :url,
    :image_url
  )

  def image_url
    object.image.url
  end
end
