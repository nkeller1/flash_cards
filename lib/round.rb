class Round
  attr_reader :deck, :turns, :recall_deck, :total_deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @recall_deck = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @recall_deck << deck.cards.shift
    new_turn
  end

  def number_correct
    turns.count do |turn|
      turn.guess == turn.card.answer
    end
  end

  def number_correct_by_category(category)
    cat_correct = 0.0
    turns.each do |turn|
      if (turn.card.category == category) && turn.correct?
      cat_correct += 1.0
      end
    end
  cat_correct
  end

  def percent_correct
    (number_correct.to_f / turns.count.to_f * 100.00).round(2)
  end

  def total_cards_per_category(category)
    total_cards = turns.find_all do |turn|
      turn.card.category == category
    end
    total_cards.count.to_i
  end

  def card_category
    unique_cards = @recall_deck.uniq do |card|
      card.category
    end
    unique_cards.each do |card|
      puts "#{card.category.to_s} - #{percent_correct_by_category(card.category)}"
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / (total_cards_per_category(category)) * 100).to_f.round(2)
  end

end
