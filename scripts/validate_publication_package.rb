#!/usr/bin/env ruby
# frozen_string_literal: true

# Validates a publication package against schemas/publication-package.schema.json.
# The JSON Schema is the single source of truth for required fields, types,
# enums, and patterns. This script is only a thin runner around JSONSchemer.

require "json"
require "pathname"

GEM_ROOT = File.expand_path("~/.gem/ruby/2.6.0/gems/json_schemer-2.2.1/lib")
$LOAD_PATH.unshift(GEM_ROOT) if Dir.exist?(GEM_ROOT)
require "json_schemer"

ROOT = File.expand_path("..", __dir__)
SCHEMA_PATH = File.join(ROOT, "schemas", "publication-package.schema.json")

abort "Schema not found: #{SCHEMA_PATH}" unless File.file?(SCHEMA_PATH)

schema = JSONSchemer.schema(JSON.parse(File.read(SCHEMA_PATH)))
file = ARGV.fetch(0) { abort "Usage: #{$PROGRAM_NAME} <publication-package.json>" }
data = JSON.parse(File.read(file))

errors = schema.validate(data).to_a
if errors.empty?
  puts "Publication package valid: #{data['id']}"
  exit 0
end

puts "Invalid publication package: #{file}"
errors.each do |error|
  pointer = error["data_pointer"].to_s.empty? ? "<root>" : error["data_pointer"]
  message  = error["error"] || error["type"] || "invalid"
  details  = error["details"] || {}
  details_msg = details.is_a?(Hash) ? details.reject { |_, v| v.to_s.empty? }.map { |k, v| "#{k}=#{v}" }.join(", ") : ""
  puts "  - #{pointer}: #{message}#{details_msg.empty? ? '' : " (#{details_msg})"}"
end
exit 1
