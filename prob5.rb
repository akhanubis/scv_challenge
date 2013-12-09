largo_maximo = ARGV.map(&:length).max
lineas = largo_maximo.times.map do |i|
  ARGV.map do |str|
    str[i] || ' '
  end * ''
end
puts lineas

