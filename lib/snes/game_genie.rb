require_relative '../mister'

module Snes
  class GameGenie
    ALPHABET = %w[D F 4 7 0 9 1 5 6 B C 8 A 2 3 E].freeze

    def initialize(code:)
      @code = code
    end

    def decrypt
      {
        address: address_value,
        replace: replace_value,
        compare: nil
      }
    end

    private

    def bit_string
      @bit_string ||= code
        .tr('-', '')
        .split('')
        .reduce(0) do |bit_string, letter|
          bit_string <<= 4
          bit_string |= ALPHABET.index(letter)
          bit_string
        end
    end

    def replace_value
      value = (bit_string >> 24) & 0xFF
      sprintf('%<value>02d', value: value)
    end

    def address_value
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

    attr_reader :code
  end
end
