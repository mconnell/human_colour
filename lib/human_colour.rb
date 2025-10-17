# frozen_string_literal: true

require_relative "human_colour/version"

# rubocop:disable Metrics/ModuleLength
module HumanColour
  class Error < StandardError; end

  LOCALES = {
    en: {
      tone: {
        light: "light",
        dark: "dark"
      },
      colour: {
        red: "red",
        orange: "orange",
        yellow: "yellow",
        green: "green",
        blue: "blue",
        purple: "purple",
        pink: "pink",
        grey: "grey",
        black: "black",
        white: "white"
      }
    },

    es: {
      tone: {
        light: "claro",
        dark: "oscuro"
      },
      colour: {
        red: "rojo",
        orange: "naranja",
        yellow: "amarillo",
        green: "verde",
        blue: "azul",
        purple: "morado",
        pink: "rosa",
        grey: "gris",
        black: "negro",
        white: "blanco"
      }
    }
  }.freeze

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.parse(rgb_string, locale: :en)
    matches = rgb_string.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/i)
    raise Error if matches.nil?

    return LOCALES[locale][:colour][:white] if rgb_string == "rgb(255,255,255)"
    return LOCALES[locale][:colour][:black] if rgb_string == "rgb(0,0,0)"

    red   = matches[1].to_i / 255.0
    green = matches[2].to_i / 255.0
    blue  = matches[3].to_i / 255.0

    l = lightness(red: red, green: green, blue: blue)
    d = delta(red: red, green: green, blue: blue)
    s = saturation(delta: d, lightness: l)
    h = hue(delta: d, red: red, green: green, blue: blue)
    t = tone(lightness: l, hue: h)
    c = colour(saturation: s, hue: h)

    localised_tone   = LOCALES[locale][:tone][t]
    localised_colour = LOCALES[locale][:colour][c]

    if locale == :es
      [localised_colour, localised_tone].compact.join(" ")
    else
      [localised_tone, localised_colour].compact.join(" ")
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def self.delta(red:, green:, blue:)
    [red, green, blue].max - [red, green, blue].min
  end
  private_class_method :delta

  def self.lightness(red:, green:, blue:)
    ([red, green, blue].max + [red, green, blue].min) / 2
  end
  private_class_method :lightness

  def self.saturation(delta:, lightness:)
    if delta.zero?
      0
    else
      delta / (1 - ((2 * lightness) - 1).abs)
    end
  end
  private_class_method :saturation

  def self.hue(delta:, red:, green:, blue:)
    return 0 if delta.zero?

    max = [red, green, blue].max
    h = if max == red
          ((green - blue) / delta) % 6
        elsif max == green
          ((blue - red) / delta) + 2
        else
          ((red - green) / delta) + 4
        end
    h * 60
  end
  private_class_method :hue

  def self.tone(lightness:, hue:)
    return nil if (260..320).cover?(hue) && lightness >= 0.22 && lightness < 0.28
    return :dark if lightness < 0.28
    return :light if lightness > 0.74

    nil
  end
  private_class_method :tone

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  def self.colour(saturation:, hue:)
    return :grey if saturation < 0.15

    case hue
    when 0...15, 355..360 then :red
    when 15...45          then :orange
    when 45...70          then :yellow
    when 70...170         then :green
    when 170...250        then :blue
    when 250...320        then :purple
    when 320...355        then :pink
    else                       :grey
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
  private_class_method :colour
end
# rubocop:enable Metrics/ModuleLength
