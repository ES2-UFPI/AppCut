class Address < ApplicationRecord
  belongs_to :user

  validates :cep, :state, :city, :neighborhood, :street, :number, presence: true
end
