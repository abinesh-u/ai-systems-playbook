#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"

required = %w[id status content_type owner title slug seo evidence links reviews publication]
nested = {"seo" => %w[intent description canonical_url], "evidence" => %w[research_records archive_assets claim_limits], "links" => %w[parent related references], "reviews" => %w[technical architecture editorial seo readiness], "publication" => %w[diagram_plan project_integration adaptation_notes]}
file = ARGV.fetch(0)
data = JSON.parse(File.read(file))
missing = required.reject { |key| data.key?(key) && !data[key].to_s.empty? }
nested.each { |key, keys| missing.concat(keys.map { |child| "#{key}.#{child}" }.reject { |path| data[key].is_a?(Hash) && !data[key][path.split(".").last].to_s.empty? }) }
abort "Invalid publication package: #{missing.join(', ')}" unless missing.empty?
abort "Invalid slug" unless data["slug"].match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
puts "Publication package valid: #{data['id']}"
