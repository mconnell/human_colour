# frozen_string_literal: true

RSpec.describe HumanColour do
  it "has a version number" do
    expect(HumanColour::VERSION).not_to be nil
  end

  describe ".parse" do
    context "rgb() strings" do
      it { expect(described_class.parse("rgb(0,0,0)")).to eq("black") }
    end
  end
end
