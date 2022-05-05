class ProfessionalProfile < ApplicationRecord
  belongs_to :user

  has_many :agendas, dependent: :destroy
  has_many :haircut_schedules, through: :agendas

  # active storage
  has_many_attached :barber_shop_images
  has_many_attached :haircut_images
end
