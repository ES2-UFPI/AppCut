module HaircutSchedulesHelper
  def return_datetimes(record)
    start_time = record.agenda.start_time
    business_hours = record.agenda.professional_profile.business_hours
    datetimes = []

    for n in 0..business_hours - 1 do
      datetimes << start_time + n.hour
    end

    datetimes
  end
end
