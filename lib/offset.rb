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

  def final_4_offset_squared
    (@date.to_i.abs2).to_s[-4..-1]
  end

  def offset_shifter
    final_4_offset_squared.split("").map {|num| num.to_i}
  end
end
