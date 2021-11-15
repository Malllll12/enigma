require "rspec"
require "date"
require "spec_helper"
require "./lib/enigma"
require "./lib/keys"
require "./lib/offset"
require "./lib/encrypt"

describe Encrypt do
  before :each do
    @encrypt = Encrypt.new("Hello World", "01234", "122521")
  end

  it 'exists' do
    expect(@encrypt).to be_an_instance_of(Encrypt)
  end

  it 'attributes' do
    expect(@encrypt.message).to eq("Hello World")
    expect(@encrypt.key.class).to eq(Keys)
    expect(@encrypt.date.class).to eq(Offset)
    expect(@encrypt.character_set.length).to eq(27)
    expect(@encrypt.character_set.include?(" ")).to eq(true)
    expect(@encrypt.character_set.include?("b")).to eq(true)
    expect(@encrypt.character_set.include?("1")).to eq(false)
  end

  it '#shifter' do
    expect(@encrypt.shifter).to be_a(Hash)
    expect(@encrypt.shifter[:a_shift]).to eq(7)
    expect(@encrypt.shifter[:b_shift]).to eq(18)
    expect(@encrypt.shifter[:c_shift]).to eq(27)
    expect(@encrypt.shifter[:d_shift]).to eq(35)
  end
end
