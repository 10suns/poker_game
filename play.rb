require_relative 'poker_hand'

cards = ''
poker_hand = nil
loop do
  puts "Please draw five cards: "
  cards = gets.chomp
  if cards.length == 10
    poker_hand = PokerHand.new(cards)
    break if poker_hand.is_valid?
  end
end

puts "Calculating your result..."
puts "Your result is: #{poker_hand.output}"
