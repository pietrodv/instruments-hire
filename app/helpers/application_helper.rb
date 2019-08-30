module ApplicationHelper
  def photo_or_fallback(instrument)
    if instrument.photo.present?
      # cl_image_tag # => generates a <img> tag
      instrument.photo
    elsif instrument.category.name == "Electric Guitar"
      asset_path('electricguitar.jpg')
      # image_tag # => generates a <img> tag
    elsif instrument.category.name == "Acoustic Guitar"
      asset_path('acoustic.jpg')
    elsif instrument.category.name == "Violin"
      asset_path('violin.jpg')
    elsif instrument.category.name == "Drums"
      asset_path('drums.jpg')
    elsif instrument.category.name == "Piano"
      asset_path('piano.jpg')
    elsif instrument.category.name == "Bass Guitar"
      asset_path('bassguitar.jpg')
    elsif instrument.category.name == "Wind"
      asset_path('wind.jpg')
    elsif instrument.category.name == "Mic"
      asset_path('mic.jpg')
    elsif instrument.category.name == "Stringed"
      asset_path('stringed.jpg')
    elsif instrument.category.name == "Percussion"
      asset_path('percussion.jpg')
    else
      asset_path('soundsgoodlogo.jpg')
    end
  end

  def user_photo_or_fallback(user)
    if user.photo.present?
      # cl_image_tag # => generates a <img> tag
      user.photo
    else
      asset_path('avatar.jpg')
      # image_tag # => generates a <img> tag
    end
  end
end
