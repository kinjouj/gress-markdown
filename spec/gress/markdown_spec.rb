require "gress/markdown"

describe Gress::Markdown do
  it "parser test" do
    data =<<EOS
---
title: test
---

test
EOS
    markdown = Gress::Markdown.parse(data)
    expect(markdown.compact.size).to eq(2)
    metadata = markdown.first
    expect(metadata).not_to be_nil
    body = markdown.last
    expect(body).not_to be_nil
  end
end
