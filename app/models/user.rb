class User < ApplicationRecord
  extend Enumerize
  has_one :professional_profile, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :haircut_schedules, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :document, presence: true
  validates :profile, presence: true

  enumerize :profile, in: %i[barber_shop client], default: :client, predicates: true, scope: true
end
