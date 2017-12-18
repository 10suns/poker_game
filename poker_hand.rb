class PokerHand
  def initialize(cards)
    @suits = []
    @ranks = []
    cards.scan(/.{2}/).each do |n|
      @suits << n[0]
      @ranks << n[1]
    end
  end

  def output
    return 'Invalid poker hand. Please draw again' unless is_valid?
    basic_results = basic_possible_results
    if basic_results.count == 1 && basic_results.values[0] == 1
      return basic_results.keys[0]
    elsif basic_results.has_key?('3C') && basic_results.has_key?('1P')
      return 'FH'
    elsif basic_results.has_key?('1P')
      return '2P'
    end
    '--'
  end

  def is_valid?
    return false if @suits.count != @ranks.count && @suits.count != 5
    valid_suits = %w(S H D C)
    valid_ranks = %w(2 3 4 5 6 7 8 9 J Q K A)
    @suits.each do |suit|
      return false unless valid_suits.include?(suit)
    end
    @ranks.each do |rank|
      return false unless valid_ranks.include?(rank)
    end
    return true
  end

  private
  # basic results for a poker.
  # They just depend on one condition 1 pair, 3 card and 4 card
  def basic_possible_results
    result = Hash.new(0)
    rank_groups.each do |_, v|
      result['1P'] += 1 if v == 2
      result['3C'] += 1 if v == 3
      result['4C'] += 1 if v == 4
    end
    result
  end

  def rank_groups
    group = Hash.new(0)
    @ranks.each do |n|
      group[n] += 1
    end
    group
  end
end