# clock.rb
def clock(hours, minutes, seconds)
  time_fields = [hours, minutes, seconds]
  max_values = [23, 59, 59]
  min_value = 0

  time_fields.each_with_index do |field, index|
    if field > max_values[index] || field < min_value
      raise ArgumentError.new("#{field} is too large")
    end
  end

  time_strings = time_fields.map do |field|
    if field < 10
      "0#{field}"
    else
      "#{field}"
    end
  end
  return "#{time_strings[0]}:#{time_strings[1]}:#{time_strings[2]}"
end