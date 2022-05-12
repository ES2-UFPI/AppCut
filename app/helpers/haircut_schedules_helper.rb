module HaircutSchedulesHelper
  def return_datetimes(record)
    start_time = record.agenda.start_time
    business_hours = record.agenda.professional_profile.business_hours
    datetimes = []

    for n in 0..business_hours - 1 do
      if record.agenda.haircut_schedules.any?
        unless record.agenda.haircut_schedules.where(reservation_date: start_time + n.hour).any?
          datetimes << start_time + n.hour
        end
      else
        datetimes << start_time + n.hour
      end        
    end

    datetimes
  end
end
