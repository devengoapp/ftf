# frozen_string_literal: true

require "json"
require_relative "lib/ftf"

begin
  json = File.read("test.json")
  JSON.parse(json)
  puts "JSON file is valid"
  FTF::Generator.new(json).validate!
rescue JSON::ParserError => e
  puts "JSON file is invalid: #{e.message}"
rescue FTF::Generator::ValidationError => e
  puts "File is not a valid FTF JSON File: #{e.message}"
end
