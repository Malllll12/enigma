class Keys
  attr_reader :key
  def initialize(key = nil)
    if key.nil?
      @key = rand(6 ** 5).to_s.rjust(5,'0')
    else
      @key = key
    end
  end

  def key_shift
    shift = []
    4.times do |num|
      shift.append @key[num].concat @key[num + 1]
    end
    shift
  end
end
