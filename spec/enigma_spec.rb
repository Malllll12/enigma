require "spec_helper"
require "rspec"
require "./lib/enigma"

describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end
end
