require "simplecov"
require "simplecov-tailwindcss"

SimpleCov.formatter = SimpleCov::Formatter::TailwindFormatter
SimpleCov.start do
  add_filter "/spec/"
end
