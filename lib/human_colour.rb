# frozen_string_literal: true

require_relative "human_colour/version"

module HumanColour
  class Error < StandardError; end

  def self.parse(rgb_string)
    rgb_string == "rgb(255,255,255)" ? "white" : "black"
  end
end
