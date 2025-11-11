# frozen_string_literal: true

RSpec.describe HumanColour do
  it "has a version number" do
    expect(HumanColour::VERSION).not_to be nil
  end

  describe ".parse" do
    colours = {
      "rgb(0,0,0)"        => { en: "black",        es: "negro",           it: "nero",             fr: "noir",          de: "schwarz",       pt: "preto",            ja: "黒" },
      "rgb(16,16,16)"     => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(32,32,32)"     => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(64,64,64)"     => { en: "dark grey",    es: "gris oscuro",     it: "grigio scuro",     fr: "gris foncé",    de: "dunkel grau",   pt: "cinza escuro",     ja: "濃い灰色" },
      "rgb(128,128,128)"  => { en: "grey",         es: "gris",            it: "grigio",           fr: "gris",          de: "grau",          pt: "cinza",            ja: "灰色" },
      "rgb(220,220,220)"  => { en: "light grey",   es: "gris claro",      it: "grigio chiaro",    fr: "gris clair",    de: "hell grau",     pt: "cinza claro",      ja: "薄い灰色" },
      "rgb(255,255,255)"  => { en: "white",        es: "blanco",          it: "bianco",           fr: "blanc",         de: "weiß",          pt: "branco",           ja: "白" },

      "rgb(32,0,0)"       => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(128,0,0)"      => { en: "dark red",     es: "rojo oscuro",     it: "rosso scuro",      fr: "rouge foncé",   de: "dunkel rot",    pt: "vermelho escuro",  ja: "濃い赤" },
      "rgb(255,0,0)"      => { en: "red",          es: "rojo",            it: "rosso",            fr: "rouge",         de: "rot",           pt: "vermelho",         ja: "赤" },
      "rgb(255,128,128)"  => { en: "light red",    es: "rojo claro",      it: "rosso chiaro",     fr: "rouge clair",   de: "hell rot",      pt: "vermelho claro",   ja: "薄い赤" },

      "rgb(255,165,0)"    => { en: "orange",       es: "naranja",         it: "arancione",        fr: "orange",        de: "orange",        pt: "laranja",          ja: "オレンジ" },
      "rgb(240,161,39)"   => { en: "orange",       es: "naranja",         it: "arancione",        fr: "orange",        de: "orange",        pt: "laranja",          ja: "オレンジ" },
      "rgb(255,200,128)"  => { en: "light orange", es: "naranja claro",   it: "arancione chiaro", fr: "orange clair",  de: "hell orange",   pt: "laranja claro",    ja: "薄いオレンジ" },

      "rgb(32,32,0)"      => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(128,128,0)"    => { en: "dark yellow",  es: "amarillo oscuro", it: "giallo scuro",     fr: "jaune foncé",   de: "dunkel gelb",   pt: "amarelo escuro",   ja: "濃い黄色" },
      "rgb(255,255,0)"    => { en: "yellow",       es: "amarillo",        it: "giallo",           fr: "jaune",         de: "gelb",          pt: "amarelo",          ja: "黄色" },
      "rgb(255,255,153)"  => { en: "light yellow", es: "amarillo claro",  it: "giallo chiaro",    fr: "jaune clair",   de: "hell gelb",     pt: "amarelo claro",    ja: "薄い黄色" },

      "rgb(0,32,0)"       => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(0,64,0)"       => { en: "dark green",   es: "verde oscuro",    it: "verde scuro",      fr: "vert foncé",    de: "dunkel grün",   pt: "verde escuro",     ja: "濃い緑" },
      "rgb(0,255,0)"      => { en: "green",        es: "verde",           it: "verde",            fr: "vert",          de: "grün",          pt: "verde",            ja: "緑" },
      "rgb(144,238,144)"  => { en: "light green",  es: "verde claro",     it: "verde chiaro",     fr: "vert clair",    de: "hell grün",     pt: "verde claro",      ja: "薄い緑" },

      "rgb(0,0,32)"       => { en: "near black",   es: "casi negro",      it: "quasi nero",       fr: "presque noir",  de: "fast schwarz",  pt: "quase preto",      ja: "黒に近い" },
      "rgb(0,0,128)"      => { en: "dark blue",    es: "azul oscuro",     it: "blu scuro",        fr: "bleu foncé",    de: "dunkel blau",   pt: "azul escuro",      ja: "濃い青" },
      "rgb(0,0,255)"      => { en: "blue",         es: "azul",            it: "blu",              fr: "bleu",          de: "blau",          pt: "azul",             ja: "青" },
      "rgb(173,216,230)"  => { en: "light blue",   es: "azul claro",      it: "blu chiaro",       fr: "bleu clair",    de: "hell blau",     pt: "azul claro",       ja: "薄い青" },

      "rgb(128,0,128)"    => { en: "purple",       es: "morado",          it: "viola",            fr: "violet",        de: "lila",          pt: "roxo",             ja: "紫" },
      "rgb(64,0,64)"      => { en: "dark purple",  es: "morado oscuro",   it: "viola scuro",      fr: "violet foncé",  de: "dunkel lila",   pt: "roxo escuro",      ja: "濃い紫" },
      "rgb(216,191,216)"  => { en: "light purple", es: "morado claro",    it: "viola chiaro",     fr: "violet clair",  de: "hell lila",     pt: "roxo claro",       ja: "薄い紫" },

      "rgb(255,105,180)"  => { en: "pink",         es: "rosa",            it: "rosa",             fr: "rose",          de: "rosa",          pt: "rosa",             ja: "ピンク" },
      "rgb(128,0,64)"     => { en: "dark pink",    es: "rosa oscuro",     it: "rosa scuro",       fr: "rose foncé",    de: "dunkel rosa",   pt: "rosa escuro",      ja: "濃いピンク" },
      "rgb(255,182,193)"  => { en: "light pink",   es: "rosa claro",      it: "rosa chiaro",      fr: "rose clair",    de: "hell rosa",     pt: "rosa claro",       ja: "薄いピンク" },

      "rgb(128,64,0)"     => { en: "brown",        es: "marrón",          it: "marrone",          fr: "brun",          de: "braun",         pt: "marrom",           ja: "茶色" },
      "rgb(181,101,29)"   => { en: "brown",        es: "marrón",          it: "marrone",          fr: "brun",          de: "braun",         pt: "marrom",           ja: "茶色" },
      "rgb(101,67,33)"    => { en: "brown",        es: "marrón",          it: "marrone",          fr: "brun",          de: "braun",         pt: "marrom",           ja: "茶色" }
    }.freeze

    colours.each do |rgb, expected_translations|
      describe rgb do
        expected_translations.each do |locale, expected|
          it "returns #{expected.inspect} for locale :#{locale}" do
            result = described_class.parse(rgb, locale: locale)
            expect(result).to eq(expected)
          end
        end
      end
    end

    context "bad format" do
      it "raises an exception" do
        expect { described_class.parse("waffle") }.to raise_error(HumanColour::Error)
      end
    end
  end
end
