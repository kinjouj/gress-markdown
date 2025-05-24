require "psych"

module Gress
  class Markdown
    def self.parse(data)
      metadata = nil
      body = nil

      match = data.match(/\A(?<header>---\s*\n.*?\n?)^(---\s*$\n?)/m)
      metadata = Psych.safe_load(
        match[:header],
        permitted_classes: [Time, DateTime],
        symbolize_names: true
      )
      body = match.post_match

      return [ metadata, body ]
    end
  end
end
