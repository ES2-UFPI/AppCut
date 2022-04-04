class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :document, presence: true
  validates :profile, presence: true

  enumerize :profile, in: %i[barber_shop client], default: :barber_shop, predicates: true, scope: true
end
