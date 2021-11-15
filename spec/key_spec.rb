require "date"
require "spec_helper"
require "rspec"
require "./lib/enigma"
require "./lib/key"

describe Key do
  before :each do
    @key = Key.new
  end

  it 'exists' do
    expect(@key).to be_an_instance_of(Key)
  end

  # it 'attributes' do
  #   expect(class.name).to eq()
  # end
end
