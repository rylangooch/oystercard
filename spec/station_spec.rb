require 'station'

describe Station do
  # describe '#initialization' do
  #   subject { described_class.new }
  # end

  subject { described_class.new(name: "Aldgate East", zone: 1) }

  it 'knows its name' do
    expect(subject.name).to eq("Aldgate East")
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(1)
  end

end
