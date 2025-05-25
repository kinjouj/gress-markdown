require "psych"

module Gress
  class Markdown
    def self.parse(data)
      match = data.match(/\A(?<header>---\s*\n.*?\n?)^(---\s*$\n?)/m)
      metadata = Psych.safe_load(
        match[:header],
        permitted_classes: [Date, Time, Symbol],
        symbolize_names: true
      )
      body = match.post_match

      return [ metadata, body ]
    end
  end
end
