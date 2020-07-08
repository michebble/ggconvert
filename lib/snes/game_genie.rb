require_relative '../mister'

module Snes
  class GameGenie
    ALPHABET = %w[D F 4 7 0 9 1 5 6 B C 8 A 2 3 E].freeze

    def initialize(formatter: Mister)
      @formatter = formatter
    end

    def to_mister_format(code)
      result = decrypt(code)
      @formatter.new(**result).format
    end

    private

    def to_raw(code)
      result = decrypt(code)
      [
        result[:address],
        result[:replace],
        result[:compare]
      ].compact.join(':')
    end

    def decrypt(code)
      bit_string = to_bit_string(code)
      {
        address: address_value(bit_string),
        replace: replace_value(bit_string)
      }
    end

    def to_bit_string(code)
      code
        .tr('-', '')
        .split('')
        .reduce(0) do |bit_string, letter|
          bit_string <<= 4
          bit_string |= ALPHABET.index(letter)
          bit_string
        end
    end

    def replace_value(bit_string)
      value = (bit_string >> 24) & 0xFF
      sprintf('%<value>02d', value: value)
    end

    def address_value(bit_string)
      address = ((bit_string >> 10) & 0xC) | ((bit_string >> 10) & 0x3)

      address <<= 4
      address |= ((bit_string >> 2) & 0xC) | ((bit_string >> 2) & 0x3)

      address <<= 4
      address |= (bit_string >> 20) & 0xF

      address <<= 4
      address |= ((bit_string << 2) & 0xC) | ((bit_string >> 14) & 0x3)

      address <<= 4
      address |= (bit_string >> 16) & 0xF

      address <<= 4
      address |= ((bit_string >> 6) & 0xC) | ((bit_string >> 6) & 0x3)
      address.to_s(16).upcase
    end
  end
end
