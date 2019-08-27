module ApplicationHelper
  def photo_or_fallback(instrument)
    if instrument.photo.present?
      # cl_image_tag # => generates a <img> tag
      instrument.photo
    else
      asset_path('violin.jpg')
      # image_tag # => generates a <img> tag
    end
  end

  def user_photo_or_fallback(user)
    if user.photo.present?
      # cl_image_tag # => generates a <img> tag
      user.photo
    else
      asset_path('violin.jpg')
      # image_tag # => generates a <img> tag
    end
  end
end
