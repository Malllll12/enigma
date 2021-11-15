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
    expect(@encrypt.key).to eq("01234")
    expect(@encrypt.date).to eq("122521")
  end
end
