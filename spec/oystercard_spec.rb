describe Oystercard do
  subject { described_class.new }


  describe "balance" do
    it "is expected to return a float" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "top_up" do
    it "is expected to top up the oystercard by a specified amount" do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
  end

end
