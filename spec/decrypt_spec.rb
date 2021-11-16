require "rspec"
require "date"
require "spec_helper"
require "./lib/enigma"
require "./lib/keys"
require "./lib/offset"
require "./lib/decrypt"

describe Decrypt do
  before :each do
    @decrypt = Decrypt.new("owltvwwyd", "01234", "122521")
  end
  it 'exists' do
    expect(@decrypt).to be_an_instance_of(Decrypt)
  end

  it 'attributes' do
    expect(@decrypt.message).to eq("owltvwwyd")
    expect(@decrypt.key.class).to eq(Keys)
    expect(@decrypt.date.class).to eq(Offset)
    expect(@decrypt.character_set.length).to eq(27)
    expect(@decrypt.character_set.include?(" ")).to eq(true)
    expect(@decrypt.character_set.include?("b")).to eq(true)
    expect(@decrypt.character_set.include?("1")).to eq(false)
  end

  it '#shifter' do
    expect(@decrypt.shifter).to be_a(Hash)
    expect(@decrypt.shifter[:a_shift]).to eq(7)
    expect(@decrypt.shifter[:b_shift]).to eq(18)
    expect(@decrypt.shifter[:c_shift]).to eq(27)
    expect(@decrypt.shifter[:d_shift]).to eq(35)
  end

  it '#decode' do
    expect(@decrypt.decode("owltvwwyd")).to eq("HelLo WOrld")
  end

  it "encodes" do
    encrypt2 = Encrypt.new("MaL", "01234", "122521")
    expect(encrypt2.encode("Mal")).to eq("tsl")
  end

  it "decrypt_hash" do
    expect(@decrypt.decrypt_hash).to be_a(Hash)
    expect(@decrypt.decrypt_hash.count).to eq(3)
  end
end
