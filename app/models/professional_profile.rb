class ProfessionalProfile < ApplicationRecord
  belongs_to :user

  # active storage
  has_many_attached :barber_shop_images
  has_many_attached :haircut_images
end
