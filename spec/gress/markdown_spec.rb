require "gress/markdown"

describe Gress::Markdown do
  it "parser test" do
    data =<<EOS
---
title: test
---

test
EOS
    Gress::Markdown.parse(data) do |markdown|
      expect(markdown.compact.size).to eq(2)
      metadata, body = markdown
      expect(metadata).not_to be_nil
      expect(body).not_to be_nil
    end
  end
end
