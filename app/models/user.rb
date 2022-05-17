class User < ApplicationRecord
  extend Enumerize
  has_one :professional_profile, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :haircut_schedules, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :sent, class_name: "Message", foreign_key: "sender_id"
  has_many :received, class_name: "Message", foreign_key: "receiver_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :document, presence: true
  validates :profile, presence: true

  enumerize :profile, in: %i[barber_shop client], default: :client, predicates: true, scope: true
end
