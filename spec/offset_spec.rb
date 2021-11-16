require "rspec"
require "date"
require "spec_helper"
require "./lib/enigma"
require "./lib/keys"
require "./lib/offset"

describe Offset do
  before :each do
    @offset = Offset.new()
  end

  it 'exists' do
    expect(@offset).to be_an_instance_of(Offset)
  end

  it 'attributes' do
    offset2 = Offset.new("040895")
    expect(offset2.date).to eq("040895")
    expect(offset2.date.length).to eq(6)
    expect(offset2.date).to be_a(String)
  end

  it "can use Date class if no argument is given" do
    expect(@offset.date).to eq(Date.today.strftime("%d%m%y"))
    expect(@offset.date.length).to eq(6)
    expect(@offset.date).to be_a(String)
  end

  it "squares the offset" do
    offset2 = Offset.new("040895")
    expect(offset2.final_4_offset_squared). to eq("1025")
  end

  it "finds final 4 of squared without argument" do
    expect(@offset.final_4_offset_squared).to eq("6641")
  end

  it '#offset_shifter' do
    offset2 = Offset.new("040895")
    expect(offset2.offset_shifter).to eq([1, 0, 2, 5])
  end
end
