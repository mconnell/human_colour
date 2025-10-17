# frozen_string_literal: true

require_relative "human_colour/version"

module HumanColour
  class Error < StandardError; end

  def self.parse(rgb_string)
    matches = rgb_string.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/i)
    raise Error if matches.nil?

    red   = matches[1].to_i / 255.0
    green = matches[2].to_i / 255.0
    blue  = matches[3].to_i / 255.0

    l = lightness(red: red, green: green, blue: blue)
    d = delta(red: red, green: green, blue: blue)
    s = saturation(delta: d, lightness: l)
    h = hue(delta: d, red: red, green: green, blue: blue)
    t = tone(lightness: l, hue: h)
    c = colour(saturation: s, hue: h)

    name = [t, c].compact.join(" ")

    # alias extremes for nicer names
    return "white" if rgb_string == "rgb(255,255,255)"
    return "black" if rgb_string == "rgb(0,0,0)"

    name
  end

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
    return "dark" if lightness < 0.28
    return "light" if lightness > 0.74

    nil
  end
  private_class_method :tone

  def self.colour(saturation:, hue:)
    return "grey" if saturation < 0.15

    case hue
    when 0...15, 355..360 then "red"
    when 15...45          then "orange"
    when 45...70          then "yellow"
    when 70...170         then "green"
    when 170...250        then "blue"
    when 250...320        then "purple"
    when 320...355        then "pink"
    else                       "grey"
    end
  end
  private_class_method :colour
end
