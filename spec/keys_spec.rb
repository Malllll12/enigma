require "date"
require "spec_helper"
require "rspec"
require "./lib/enigma"
require "./lib/keys"

describe Keys do
  before :each do
    @key = Keys.new
    @new_key = Keys.new("02715")
  end

  it 'exists' do
    expect(@key).to be_an_instance_of(Keys)
    expect(@key.key.length).to eq(5)
  end

  it 'can recieve a key as argument' do
    expect(@new_key.key).to eq("02715")
  end

  it 'creates random keys' do
  expect(@key.key).to be_a(String)
  expect(@key.key.length).to eq(5)
  expect(@key.key).to eq(@key.key)
  end

  it 'splits keys' do
    expect(@new_key.key_shift).to eq(["02", "27", "71", "15"])
  end
end
