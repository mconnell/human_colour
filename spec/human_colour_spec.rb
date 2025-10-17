# frozen_string_literal: true

RSpec.describe HumanColour do
  it "has a version number" do
    expect(HumanColour::VERSION).not_to be nil
  end

  describe ".parse" do
    context "greyscale" do
      describe "black" do
        it { expect(described_class.parse("rgb(0,0,0)")).to eq("black") }
        it { expect(described_class.parse("rgb(0,0,0)", locale: :en)).to eq("black") }
        it { expect(described_class.parse("rgb(0,0,0)", locale: :es)).to eq("negro") }
      end

      describe "dark grey" do
        it { expect(described_class.parse("rgb(64,64,64)")).to eq("dark grey") }
        it { expect(described_class.parse("rgb(64,64,64)", locale: :en)).to eq("dark grey") }
        it { expect(described_class.parse("rgb(64,64,64)", locale: :es)).to eq("gris oscuro") }
      end

      describe "grey" do
        it { expect(described_class.parse("rgb(128,128,128)")).to eq("grey") }
        it { expect(described_class.parse("rgb(128,128,128)", locale: :en)).to eq("grey") }
        it { expect(described_class.parse("rgb(128,128,128)", locale: :es)).to eq("gris") }
      end

      describe "light grey" do
        it { expect(described_class.parse("rgb(220,220,220)")).to eq("light grey") }
        it { expect(described_class.parse("rgb(220,220,220)", locale: :en)).to eq("light grey") }
        it { expect(described_class.parse("rgb(220,220,220)", locale: :es)).to eq("gris claro") }
      end

      describe "white" do
        it { expect(described_class.parse("rgb(255,255,255)")).to eq("white") }
        it { expect(described_class.parse("rgb(255,255,255)", locale: :en)).to eq("white") }
        it { expect(described_class.parse("rgb(255,255,255)", locale: :es)).to eq("blanco") }
      end
    end

    context "reds" do
      describe "dark red" do
        it { expect(described_class.parse("rgb(128,0,0)")).to eq("dark red") }
        it { expect(described_class.parse("rgb(128,0,0)", locale: :en)).to eq("dark red") }
        it { expect(described_class.parse("rgb(128,0,0)", locale: :es)).to eq("rojo oscuro") }
      end

      describe "red" do
        it { expect(described_class.parse("rgb(255,0,0)")).to eq("red") }
        it { expect(described_class.parse("rgb(255,0,0)", locale: :en)).to eq("red") }
        it { expect(described_class.parse("rgb(255,0,0)", locale: :es)).to eq("rojo") }
      end

      describe "light red" do
        it { expect(described_class.parse("rgb(255,128,128)")).to eq("light red") }
        it { expect(described_class.parse("rgb(255,128,128)", locale: :en)).to eq("light red") }
        it { expect(described_class.parse("rgb(255,128,128)", locale: :es)).to eq("rojo claro") }
      end
    end

    context "oranges" do
      describe "dark orange" do
        it { expect(described_class.parse("rgb(128,64,0)")).to eq("dark orange") }
        it { expect(described_class.parse("rgb(128,64,0)", locale: :en)).to eq("dark orange") }
        it { expect(described_class.parse("rgb(128,64,0)", locale: :es)).to eq("naranja oscuro") }
      end

      describe "orange" do
        it { expect(described_class.parse("rgb(255,165,0)")).to eq("orange") }
        it { expect(described_class.parse("rgb(255,165,0)", locale: :en)).to eq("orange") }
        it { expect(described_class.parse("rgb(255,165,0)", locale: :es)).to eq("naranja") }
      end

      describe "light orange" do
        it { expect(described_class.parse("rgb(255,200,128)")).to eq("light orange") }
        it { expect(described_class.parse("rgb(255,200,128)", locale: :en)).to eq("light orange") }
        it { expect(described_class.parse("rgb(255,200,128)", locale: :es)).to eq("naranja claro") }
      end
    end

    context "yellows" do
      describe "dark yellow" do
        it { expect(described_class.parse("rgb(128,128,0)")).to eq("dark yellow") }
        it { expect(described_class.parse("rgb(128,128,0)", locale: :en)).to eq("dark yellow") }
        it { expect(described_class.parse("rgb(128,128,0)", locale: :es)).to eq("amarillo oscuro") }
      end

      describe "yellow" do
        it { expect(described_class.parse("rgb(255,255,0)")).to eq("yellow") }
        it { expect(described_class.parse("rgb(255,255,0)", locale: :en)).to eq("yellow") }
        it { expect(described_class.parse("rgb(255,255,0)", locale: :es)).to eq("amarillo") }
      end

      describe "light yellow" do
        it { expect(described_class.parse("rgb(255,255,153)")).to eq("light yellow") }
        it { expect(described_class.parse("rgb(255,255,153)", locale: :en)).to eq("light yellow") }
        it { expect(described_class.parse("rgb(255,255,153)", locale: :es)).to eq("amarillo claro") }
      end
    end

    context "greens" do
      describe "dark green" do
        it { expect(described_class.parse("rgb(0,64,0)")).to eq("dark green") }
        it { expect(described_class.parse("rgb(0,64,0)", locale: :en)).to eq("dark green") }
        it { expect(described_class.parse("rgb(0,64,0)", locale: :es)).to eq("verde oscuro") }
      end

      describe "green" do
        it { expect(described_class.parse("rgb(0,255,0)")).to eq("green") }
        it { expect(described_class.parse("rgb(0,255,0)", locale: :en)).to eq("green") }
        it { expect(described_class.parse("rgb(0,255,0)", locale: :es)).to eq("verde") }
      end

      describe "light green" do
        it { expect(described_class.parse("rgb(144,238,144)")).to eq("light green") }
        it { expect(described_class.parse("rgb(144,238,144)", locale: :en)).to eq("light green") }
        it { expect(described_class.parse("rgb(144,238,144)", locale: :es)).to eq("verde claro") }
      end
    end

    context "blues" do
      describe "dark blue" do
        it { expect(described_class.parse("rgb(0,0,128)")).to eq("dark blue") }
        it { expect(described_class.parse("rgb(0,0,128)", locale: :en)).to eq("dark blue") }
        it { expect(described_class.parse("rgb(0,0,128)", locale: :es)).to eq("azul oscuro") }
      end

      describe "blue" do
        it { expect(described_class.parse("rgb(0,0,255)")).to eq("blue") }
        it { expect(described_class.parse("rgb(0,0,255)", locale: :en)).to eq("blue") }
        it { expect(described_class.parse("rgb(0,0,255)", locale: :es)).to eq("azul") }
      end

      describe "light blue" do
        it { expect(described_class.parse("rgb(173,216,230)")).to eq("light blue") }
        it { expect(described_class.parse("rgb(173,216,230)", locale: :en)).to eq("light blue") }
        it { expect(described_class.parse("rgb(173,216,230)", locale: :es)).to eq("azul claro") }
      end
    end

    context "purples" do
      describe "dark purple" do
        it { expect(described_class.parse("rgb(64,0,64)")).to eq("dark purple") }
        it { expect(described_class.parse("rgb(64,0,64)", locale: :en)).to eq("dark purple") }
        it { expect(described_class.parse("rgb(64,0,64)", locale: :es)).to eq("morado oscuro") }
      end

      describe "purple" do
        it { expect(described_class.parse("rgb(128,0,128)")).to eq("purple") }
        it { expect(described_class.parse("rgb(128,0,128)", locale: :en)).to eq("purple") }
        it { expect(described_class.parse("rgb(128,0,128)", locale: :es)).to eq("morado") }
      end

      describe "light purple" do
        it { expect(described_class.parse("rgb(216,191,216)")).to eq("light purple") }
        it { expect(described_class.parse("rgb(216,191,216)", locale: :en)).to eq("light purple") }
        it { expect(described_class.parse("rgb(216,191,216)", locale: :es)).to eq("morado claro") }
      end
    end

    context "pinks" do
      describe "dark pink" do
        it { expect(described_class.parse("rgb(128,0,64)")).to eq("dark pink") }
        it { expect(described_class.parse("rgb(128,0,64)", locale: :en)).to eq("dark pink") }
        it { expect(described_class.parse("rgb(128,0,64)", locale: :es)).to eq("rosa oscuro") }
      end

      describe "pink" do
        it { expect(described_class.parse("rgb(255,105,180)")).to eq("pink") }
        it { expect(described_class.parse("rgb(255,105,180)", locale: :en)).to eq("pink") }
        it { expect(described_class.parse("rgb(255,105,180)", locale: :es)).to eq("rosa") }
      end

      describe "light pink" do
        it { expect(described_class.parse("rgb(255,182,193)")).to eq("light pink") }
        it { expect(described_class.parse("rgb(255,182,193)", locale: :en)).to eq("light pink") }
        it { expect(described_class.parse("rgb(255,182,193)", locale: :es)).to eq("rosa claro") }
      end
    end

    context "bad format" do
      it "raises an exception" do
        expect { described_class.parse("waffle") }.to raise_error(HumanColour::Error)
      end
    end
  end
end
