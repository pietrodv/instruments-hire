module ApplicationHelper
  def photo_or_fallback(instrument)
    if instrument.photo.present?
      # cl_image_tag # => generates a <img> tag
      cl_image_path(instrument.photo)
    else
      asset_path('violin.jpg')
      # image_tag # => generates a <img> tag
    end
  end
end
