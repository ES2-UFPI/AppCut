module AgendasHelper
  def get_hours(record)
    start_time = record.start_time
    business_hours = record.professional_profile.business_hours
    datetimes = []

    for n in 0..business_hours - 1 do
      datetimes << start_time + n.hour
    end

    datetimes
  end
end
