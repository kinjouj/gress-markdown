require "gress/markdown"

describe Gress::Markdown do
  it "parser test" do
    data =<<EOS
---
title: test
date: 2025-01-01 00:00:00
categories:
  - Test: test
---

test
EOS

    metadata, body = Gress::Markdown.parse(data)
    expect(metadata).not_to be_nil
    expect(body).not_to be_nil
  end
end
