class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  has_one_attached :profile_image

  has_many :books, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20 }, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def get_profile_image(width: 100, height: 100)
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      ActionController::Base.helpers.asset_path('default-image.jpg')
    end
  end
end