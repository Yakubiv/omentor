date_format = @time_slot.all_day_event? ? TimeSlot::DATE_FORMAT : TimeSlot::DATETIME_FORMAT
json.id @time_slot.id
json.start @time_slot.start_at.strftime(date_format)
json.end @time_slot.end_at.strftime(date_format)