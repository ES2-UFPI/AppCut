class ProfessionalProfile < ApplicationRecord
  belongs_to :user

  has_many :agendas, dependent: :destroy

  # active storage
  has_one_attached :logo

  has_many_attached :barber_shop_images
  has_many_attached :haircut_images

  scope :active, -> { where(:active => true)}
end
