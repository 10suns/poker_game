require_relative 'poker_hand'

cards = ''
loop do
  puts "Please draw five cards: "
  cards = gets.chomp
  break if cards.length == 10
end

puts "Calculating your result..."
poker_hand = PokerHand.new(cards)
puts "Your result is: #{poker_hand.output}"
