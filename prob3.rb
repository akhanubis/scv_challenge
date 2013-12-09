class Carta
  attr_accessor :numero, :palo
  def initialize(str)
    self.numero =  Carta.numero(str[0])
    self.palo = str[1]
  end

  class << self
    NUMEROS = {
        'A' => 1,
        'D' => 10,
        'J' => 11,
        'Q' => 12,
        'K' => 13
    }
    def numero(c)
      n = c.to_i
      n == 0 ? NUMEROS[c] : n
    end
  end
end

def ocurrencias(cartas)
  cartas.group_by(&:numero).map { |_, cs| cs.length }
end

ESCALERA = ->(cartas) {
  sorted = cartas.map(&:numero).sort
  if sorted.first == 1 && sorted.last == 13
    sorted.push(14).shift
  end
  sorted.each_cons(2).all? { |(a,b)| a + 1 == b || a + 12 == b + 13 }
}

COLOR = ->(cartas) {
  cartas.map(&:palo).uniq!.size == 1
}

JUGADAS = {
    'escalera real' => ->(cartas) {
      ESCALERA.(cartas) && COLOR.(cartas) && cartas.map(&:numero).sort == [1, 10, 11, 12, 13]
    },
    'escalera de color' => ->(cartas) {
      ESCALERA.(cartas) && COLOR.(cartas)
    },
    'poker' => ->(cartas) {
      ocurrencias(cartas).max == 4
    },
    'full' => ->(cartas) {
      ocurrencias(cartas).sort.last(2) == [2,3]
    },
    'color' => COLOR,
    'escalera' => ESCALERA,
    'pierna' => ->(cartas) {
      ocurrencias(cartas).max == 3
    },
    'doble par' => ->(cartas) {
      ocurrencias(cartas).sort.last(2) == [2,2]
    },
    'par' => ->(cartas) {
      ocurrencias(cartas).max == 2
    },
    'carta mas alta' => ->(_) { true }
}

cartas = ARGV.map { |str| Carta.new(str) }
puts JUGADAS.find { |_, checker| checker.(cartas) }.first

