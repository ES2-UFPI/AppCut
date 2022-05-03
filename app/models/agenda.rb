class Agenda < ApplicationRecord
  belongs_to :professional_profile
  
  validates :start_time, presence: true
  validates :start_time, future_date: true
end
