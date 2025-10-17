# frozen_string_literal: true

require_relative "human_colour/version"

module HumanColour
  class Error < StandardError; end

  def self.parse(_rgb_string)
    "black"
  end
end
