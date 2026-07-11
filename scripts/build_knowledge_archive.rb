#!/usr/bin/env ruby
# frozen_string_literal: true

# Imports a supplied Markdown archive into knowledge-os without altering the
# source archive. It intentionally keeps only the Phase 1 canonical metadata
# fields in each destination front matter block; the source archive remains
# the authoritative, untouched preservation copy.

require "date"
require "fileutils"
require "json"
require "yaml"

archive = File.expand_path(ARGV.fetch(0, "/Users/abi/Downloads/knowledge-archive"))
root = File.expand_path("..", __dir__)

directories = %w[
  knowledge/linkedin knowledge/website knowledge/github knowledge/medium
  knowledge/research knowledge/references knowledge/images knowledge/diagrams
  knowledge/metadata content/drafts content/pillar-pages content/articles
  content/newsletter content/linkedin docs/architecture docs/editorial docs/brand
  docs/pipeline templates scripts assets .github
]
directories.each { |path| FileUtils.mkdir_p(File.join(root, path)) }

destination_for = {
  "linkedin" => "knowledge/linkedin",
  "website" => "knowledge/website",
  "github" => "knowledge/github",
  "medium" => "knowledge/medium",
  "metadata" => "knowledge/metadata",
  "references" => "knowledge/references"
}

def split_front_matter(text)
  return [{}, text] unless text.start_with?("---\n")

  match = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  return [{}, text] unless match

  begin
    metadata = YAML.safe_load(match[1], permitted_classes: [Date], aliases: false) || {}
  rescue Psych::SyntaxError
    # Some supplied files have descriptive values containing an unquoted colon.
    # Extract only the flat scalar/list fields needed for the canonical schema.
    metadata = {}
    current_key = nil
    match[1].each_line do |line|
      if (field = line.match(/\A([A-Za-z_]+):\s*(.*)\s*\z/))
        current_key = field[1]
        value = field[2]
        if value.empty?
          metadata[current_key] = []
        elsif value.start_with?("[")
          metadata[current_key] = value[1..-2].split(",").map { |item| item.strip.gsub(/\A[\"']|[\"']\z/, "") }
        else
          metadata[current_key] = value.gsub(/\A[\"']|[\"']\z/, "")
        end
      elsif (item = line.match(/\A\s+-\s+(.*)\s*\z/)) && current_key
        metadata[current_key] = [] unless metadata[current_key].is_a?(Array)
        metadata[current_key] << item[1].gsub(/\A[\"']|[\"']\z/, "")
      end
    end
  end
  [metadata, text[match[0].length..]]
end

def yaml_scalar(value)
  JSON.generate(value.to_s)
end

def yaml_list(values)
  values = Array(values).compact
  return "[]" if values.empty?

  "[#{values.map { |value| yaml_scalar(value) }.join(', ')}]"
end

def canonical_front_matter(meta, source_file)
  date = meta["date"] || ""
  {
    "title" => meta["title"] || "",
    "platform" => meta["platform"] || "",
    "url" => meta["url"] || "",
    "date" => date,
    "content_type" => meta["content_type"] || "",
    "topics" => Array(meta["topics"]),
    "tags" => Array(meta["tags"]),
    "technologies" => Array(meta["technologies"]),
    "projects" => Array(meta["projects"]),
    "audience" => meta["audience"] || "",
    "difficulty" => meta["difficulty"] || "",
    "related_content" => Array(meta["related_content"]),
    "source_file" => source_file
  }
end

assets = []
Dir.glob(File.join(archive, "**", "*.md")).sort.each do |source|
  relative_source = source.delete_prefix("#{archive}/")
  root_folder = relative_source.split("/", 2).first
  destination_folder = destination_for.fetch(root_folder, "knowledge/references")
  destination = File.join(root, destination_folder, File.basename(source).downcase.tr("_ ", "--"))
  meta, body = split_front_matter(File.binread(source).force_encoding("UTF-8"))
  canonical = canonical_front_matter(meta, relative_source)

  front_matter = ["---"]
  canonical.each do |key, value|
    serialized = value.is_a?(Array) ? yaml_list(value) : yaml_scalar(value)
    front_matter << "#{key}: #{serialized}"
  end
  front_matter << "---" << ""
  File.write(destination, front_matter.join("\n") + body)
  assets << canonical.merge("filename" => destination.delete_prefix("#{root}/"))
end

readme = <<~MARKDOWN
  ---
  title: "AI Systems Playbook"
  platform: ""
  url: ""
  date: ""
  content_type: "Archive Documentation"
  topics: []
  tags: []
  technologies: []
  projects: []
  audience: ""
  difficulty: ""
  related_content: []
  source_file: ""
  ---

  # AI Systems Playbook

  This repository is a structured, machine-readable preservation layer for the supplied knowledge archive.

  - Source archive: each asset records its original relative path in `source_file`.
  - Scope: archive hygiene only; no new articles or editorial repurposing.
  - Navigation: see [knowledge-index.md](knowledge-index.md) and [statistics.md](statistics.md).

  Empty workflow folders are retained with `.gitkeep` files so the repository structure is available from the first commit.
MARKDOWN
File.write(File.join(root, "README.md"), readme)

directories.each do |directory|
  path = File.join(root, directory)
  next unless Dir.empty?(path)

  File.write(File.join(path, ".gitkeep"), "")
end

def display(value)
  values = Array(value).reject { |item| item.nil? || item == "" }
  values.empty? ? "—" : values.join(", ")
end

def group_assets(assets, key)
  assets.group_by do |asset|
    values = Array(asset[key]).reject { |value| value.nil? || value == "" }
    values.empty? ? ["Unspecified"] : values
  end.flat_map { |values, members| values.map { |value| [value, members] } }
        .group_by(&:first).transform_values { |pairs| pairs.flat_map(&:last) }
end

def asset_rows(items)
  rows = ["| Title | Filename | Platform | Date | Topics | Project |", "| --- | --- | --- | --- | --- | --- |"]
  items.sort_by { |asset| [asset["date"].to_s.empty? ? "9999-99-99" : asset["date"].to_s, asset["title"].to_s] }.each do |asset|
    rows << "| #{asset["title"]} | `#{asset["filename"]}` | #{asset["platform"] == "" ? "—" : asset["platform"]} | #{asset["date"] == "" ? "—" : asset["date"]} | #{display(asset["topics"])} | #{display(asset["projects"])} |"
  end
  rows.join("\n")
end

index = ["---", "title: \"Knowledge Index\"", "platform: \"\"", "url: \"\"", "date: \"\"", "content_type: \"Archive Index\"", "topics: []", "tags: []", "technologies: []", "projects: []", "audience: \"\"", "difficulty: \"\"", "related_content: []", "source_file: \"\"", "---", "", "# Knowledge Index", "", "Generated from the supplied archive. The source copy is preserved outside this repository; `source_file` in each asset records its origin.", "", "## All Assets", "", asset_rows(assets)]
[["Platform", "platform"], ["Topic", "topics"], ["Project", "projects"], ["Date", "date"], ["Technology", "technologies"], ["Content Type", "content_type"]].each do |label, key|
  index += ["", "## By #{label}"]
  group_assets(assets, key).sort_by { |name, _| name.to_s }.each do |name, members|
    index += ["", "### #{name}", "", asset_rows(members)]
  end
end
File.write(File.join(root, "knowledge-index.md"), index.join("\n") + "\n")

def count_table(assets, key)
  counts = group_assets(assets, key).transform_values(&:length)
  lines = ["| Value | Count |", "| --- | ---: |"]
  counts.sort_by { |name, count| [-count, name.to_s] }.each { |name, count| lines << "| #{name} | #{count} |" }
  lines.join("\n")
end

missing = {
  "date" => assets.select { |asset| asset["date"].to_s.empty? },
  "platform" => assets.select { |asset| asset["platform"].to_s.empty? },
  "url" => assets.select { |asset| asset["url"].to_s.empty? },
  "content_type" => assets.select { |asset| asset["content_type"].to_s.empty? },
  "audience" => assets.select { |asset| asset["audience"].to_s.empty? },
  "difficulty" => assets.select { |asset| asset["difficulty"].to_s.empty? }
}
statistics = ["---", "title: \"Archive Statistics\"", "platform: \"\"", "url: \"\"", "date: \"\"", "content_type: \"Archive Statistics\"", "topics: []", "tags: []", "technologies: []", "projects: []", "audience: \"\"", "difficulty: \"\"", "related_content: []", "source_file: \"\"", "---", "", "# Archive Statistics", "", "## Total Assets", "", "#{assets.length}", "", "## By Platform", "", count_table(assets, "platform"), "", "## By Content Type", "", count_table(assets, "content_type"), "", "## By Topic", "", count_table(assets, "topics"), "", "## By Project", "", count_table(assets, "projects"), "", "## By Technology", "", count_table(assets, "technologies"), "", "## Gaps and Incomplete Metadata", ""]
missing.each do |field, items|
  next if items.empty?
  statistics << "- **#{field}** (#{items.length}): #{items.map { |asset| "`#{asset["filename"]}`" }.join(', ')}"
end
statistics += ["", "Notes:", "", "- Profile, reference, and legacy-index assets may have a collection date in their original front matter, but their publication date is not stated; `date` is left blank rather than conflating the two.", "- No projects are explicitly assigned in the source metadata for #{assets.count { |asset| Array(asset["projects"]).empty? }} assets.", "- This report counts archive assets only; structural `.gitkeep` files are excluded."]
known_filenames = assets.map { |asset| File.basename(asset["filename"]) }
unresolved_related = assets.flat_map do |asset|
  Array(asset["related_content"]).reject { |item| known_filenames.include?(item) }.map do |item|
    [asset["filename"], item]
  end
end
unless unresolved_related.empty?
  statistics += ["", "## Content Integrity Notes", "", "The following `related_content` values were preserved exactly from the source but do not resolve to an imported filename:", ""]
  unresolved_related.each { |filename, related| statistics << "- `#{filename}` → `#{related}`" }
end
File.write(File.join(root, "statistics.md"), statistics.join("\n") + "\n")

puts "Imported #{assets.length} Markdown assets into #{root}"
