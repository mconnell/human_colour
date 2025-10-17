# frozen_string_literal: true

RSpec.describe HumanColour do
  it "has a version number" do
    expect(HumanColour::VERSION).not_to be nil
  end

  describe ".parse" do
    context "greyscale" do
      it { expect(described_class.parse("rgb(0,0,0)")).to eq("black") }
      it { expect(described_class.parse("rgb(64,64,64)")).to eq("dark grey") }
      it { expect(described_class.parse("rgb(128,128,128)")).to eq("grey") }
      it { expect(described_class.parse("rgb(220,220,220)")).to eq("light grey") }
      it { expect(described_class.parse("rgb(255,255,255)")).to eq("white") }
    end

    context "reds" do
      it { expect(described_class.parse("rgb(128,0,0)")).to eq("dark red") }
      it { expect(described_class.parse("rgb(255,0,0)")).to eq("red") }
      it { expect(described_class.parse("rgb(255,128,128)")).to eq("light red") }
    end

    context "oranges" do
      it { expect(described_class.parse("rgb(128,64,0)")).to eq("dark orange") }
      it { expect(described_class.parse("rgb(255,165,0)")).to eq("orange") }
      it { expect(described_class.parse("rgb(255,200,128)")).to eq("light orange") }
    end

    context "yellows" do
      it { expect(described_class.parse("rgb(128,128,0)")).to eq("dark yellow") }
      it { expect(described_class.parse("rgb(255,255,0)")).to eq("yellow") }
      it { expect(described_class.parse("rgb(255,255,153)")).to eq("light yellow") }
    end

    context "greens" do
      it { expect(described_class.parse("rgb(0,64,0)")).to eq("dark green") }
      it { expect(described_class.parse("rgb(0,255,0)")).to eq("green") }
      it { expect(described_class.parse("rgb(144,238,144)")).to eq("light green") }
    end

    context "blues" do
      it { expect(described_class.parse("rgb(0,0,128)")).to eq("dark blue") }
      it { expect(described_class.parse("rgb(0,0,255)")).to eq("blue") }
      it { expect(described_class.parse("rgb(173,216,230)")).to eq("light blue") }
    end

    context "purples" do
      it { expect(described_class.parse("rgb(64,0,64)")).to eq("dark purple") }
      it { expect(described_class.parse("rgb(128,0,128)")).to eq("purple") }
      it { expect(described_class.parse("rgb(216,191,216)")).to eq("light purple") }
    end

    context "pinks" do
      it { expect(described_class.parse("rgb(128,0,64)")).to eq("dark pink") }
      it { expect(described_class.parse("rgb(255,105,180)")).to eq("pink") }
      it { expect(described_class.parse("rgb(255,182,193)")).to eq("light pink") }
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
