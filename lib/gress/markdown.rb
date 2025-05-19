# frozen_string_literal: true

require_relative "markdown/version"
require "psych"

module Gress
  module Markdown
      def self.parse(data)
        raise RuntimeError if data.nil?
        metadata = nil
        body = nil

          md = data.match(/\A(?<metadata>---\s*\n.*?\n?)^(---\s*$\n?)/m)
          raise RuntimeError, "missing metadata" if md.nil?
          metadata = Psych.safe_load(md[:metadata], permitted_classes: [Time, DateTime], symbolize_names: true)
          raise RuntimeError, "invalid metadata" if metadata.class != Hash
          body = md.post_match

        return [ metadata, body ]
      end
  end
end
