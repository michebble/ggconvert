class Snes
  ALPHABET_SNES = %w[D F 4 7 0 9 1 5 6 B C 8 A 2 3 E].freeze

  def to_raw(code)
    bit_string = to_bit_string(code)
    [
      build_address(bit_string),
      build_value(bit_string)
    ].join(':')
  end

  private

  def to_bit_string(code)
    code
      .tr('-', '')
      .split('')
      .reduce(0) do |bit_string, letter|
        bit_string <<= 4
        bit_string |= ALPHABET_SNES.index(letter)
        bit_string
      end
  end

  def build_value(bit_string)
    value = (bit_string >> 24) & 0xFF
    sprintf('%<value>02d', value: value)
  end

  def build_address(bit_string)
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
