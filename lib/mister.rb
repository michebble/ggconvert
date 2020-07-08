class Mister
  EMPTY_VALUE = '00'.freeze
  ENABLED_VALUE = '01'.freeze

  private_constant :EMPTY_VALUE, :ENABLED_VALUE

  def initialize(address:, compare: nil, replace:)
    @address = address
    @compare = compare
    @replace = replace
  end

  def format
    [
      compare_enabled,
      address_value,
      compare_value,
      replace_value
    ].join(' ')
  end

  private

  def address_value
    reversed_address = chunk(address).reverse
    pad(reversed_address)
  end

  def compare_enabled
    compare.nil? ? pad : pad([ENABLED_VALUE])
  end

  def compare_value
    compare.nil? ? pad : pad([compare])
  end

  def replace_value
    pad([replace])
  end

  def chunk(string, size = 2)
    (0..(string.length - 1) / size).map do |i|
      string[i * size, size]
    end
  end

  def pad(values = [])
    values << EMPTY_VALUE while values.length < 4
    values
  end

  attr_reader :address, :compare, :replace
end
