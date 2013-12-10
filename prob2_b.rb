normalizadas = ARGV.map do |str|
  str.downcase.chars.select { |l| l =~ /\w/ }.sort
end
pares = normalizadas.combination(2).select do |combo|
  combo.first == combo.last
end
puts pares.length
