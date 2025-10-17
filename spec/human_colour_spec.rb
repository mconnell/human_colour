# frozen_string_literal: true

RSpec.describe HumanColour do
  it "has a version number" do
    expect(HumanColour::VERSION).not_to be nil
  end

  describe ".parse" do
    context "rgb() strings" do
      it { expect(described_class.parse("rgb(0,0,0)")).to eq("black") }
      it { expect(described_class.parse("rgb(255,255,255)")).to eq("white") }
    end

    context "bad format" do
      it "raises an exception" do
        expect { described_class.parse("waffle") }.to(
          raise_error { HumanColour::Error }
        )
      end
    end
  end
end
