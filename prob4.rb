PAREDES = ARGV[0].split(',').map(&:to_i)

def contenido?(x, h)
  return false if PAREDES[x] > h
  PAREDES.take(x).any? { |a| a > h } && PAREDES[x + 1..-1].any? { |a| a > h }
end
total = 0
max_y = PAREDES.max
(0...max_y).each do |h|
  PAREDES.length.times do |x|
    total += 1 if contenido?(x, h)
  end
end
puts total