require "spec_helper"
require "rspec"
require "date"
require "./lib/enigma"

describe Enigma do
  before :each do
    @enigma = Enigma.new
    @encrypt = Encrypt.new("Hello World", "01234", "122521")
    @decrypt = Decrypt.new("keder ohulw", "02715", "040895")
  end

  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it "has an output hash" do
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    expect(@enigma.encrypt("Hello World", "02715", "040895")).to eq(expected)
  end

  it "has an outbut hash" do
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end
end
