require 'pry'

class ChtReader
  def initialize(path)
    @path = path
    @entries = parse_file
  end

  def title
    @title ||= File.basename(path, '.cht')
  end

  def code_list() end

  private

  def parse_file
    output = {}
    File.foreach(@path) do |line|
      next unless line.match?('code') || line.match?('desc')

      parts = line.split('=').map(&:strip)
      key, value = parts
      output[key.to_sym] = value.undump
    end
    output
  end

  def reduce_codes
    entries.reduce do |entry|

    end
  end

  attr_reader :path, :output
end
