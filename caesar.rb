# frozen_string_literal: true

def cycle_through(floor, ceiling, index, shift)
  negative_flag = false
  if shift.negative?
    shift = shift.abs
    negative_flag = true
  end

  while shift.positive?
    if (index == ceiling) && !negative_flag
      index = floor
    elsif (index == floor) && negative_flag
      index = ceiling
    elsif negative_flag
      index -= 1
    else
      index += 1
    end

    shift -= 1

  end
  index
end

def caesar_cipher(message, shift = 0)
  new_msg = message.chars.map do |c|
    ascii_code = c.ord
    case ascii_code
    when 48..57
      cycle_through(48, 57, ascii_code, shift).chr
    when 65..90
      cycle_through(65, 90, ascii_code, shift).chr
    when 97..122
      cycle_through(97, 122, ascii_code, shift).chr
    else
      c
    end
  end
  new_msg.join
end
