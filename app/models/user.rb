class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  def profile_image_url
    if profile_image.attached?
      Rails.application.routes.url_helpers.url_for(profile_image)
    else
      'assets/images/noImage.jpg'
    end
  end
  
end
