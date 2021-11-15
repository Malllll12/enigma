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
end
