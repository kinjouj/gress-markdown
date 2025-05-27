require "psych"

module Gress
  class Markdown
    def self.parse(txt, options={ symbolize_names: true, permitted_classes: [Date, Time, Symbol]})
      match = txt.match(/\A(?<header>---\s*\n.*?\n?)^(---\s*$\n?)/m)
      metadata = Psych.safe_load(match[:header], **options)
      body = match.post_match
      [ metadata, body ]
    end
  end
end
