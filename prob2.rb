ocurrencias = ARGV.map do |str|
  jashito = str.each_char.each_with_object(Hash.new(0)) do |char, counter|
    counter[char.downcase] += 1
  end
  jashito.select { |k, _| k =~ /\w/ }
end
pares = ocurrencias.combination(2).select do |combo|
  combo.first == combo.last
end
puts pares.length