# frozen_string_literal: true

require "zeitwerk"

module FTF
  loader = Zeitwerk::Loader.for_gem
  loader.inflector.inflect "ftf" => "FTF"
  loader.setup
end
