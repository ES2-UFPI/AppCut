class Agenda < ApplicationRecord
  belongs_to :professional_profile

  has_many :haircut_schedules, dependent: :destroy
  
  validates :start_time, presence: true
  validates :start_time, future_date: true
end
