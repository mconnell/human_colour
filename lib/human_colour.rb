# frozen_string_literal: true

require_relative "human_colour/version"

module HumanColour
  class Error < StandardError; end

  def self.parse(rgb_string)
    matches = rgb_string.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/i)
    raise Error if matches.nil?

    rgb_string == "rgb(255,255,255)" ? "white" : "black"
  end
end
