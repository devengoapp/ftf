# frozen_string_literal: true

require "json"
require_relative "lib/ftf"

json = File.read("test.json")
JSON.parse(json)
puts "Generating FTF file..."
FTF::Generator.new(json).generate!
puts "FTF file generated successfully"
