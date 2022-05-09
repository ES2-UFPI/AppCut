class HaircutSchedule < ApplicationRecord
  belongs_to :agenda
  belongs_to :user

  validates :reservation_date, presence: true
end
