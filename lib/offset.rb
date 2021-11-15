require 'date'

class Offset
  attr_reader :date
  def initialize(date = nil)
    if date.nil?
      @date = Date.today.strftime("%d%m%y")
    else
      @date = date
    end
  end

  def offset_squared
    date = @date.to_i
    squared = (date * date).to_s
    squared
  end

  def final_4
    four = []
    four << offset_squared[-4].to_i
    four << offset_squared[-3].to_i
    four << offset_squared[-2].to_i
    four << offset_squared[-1].to_i
  end

  def a_offset
    final_4[0]
  end

  def b_offset
    final_4[1]
  end

  def c_offset
    final_4[2]
  end

  def d_offset
    final_4[3]
  end
end
