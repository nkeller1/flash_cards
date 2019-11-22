require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'


  @round = Round.new(
  @deck = Deck.new(
  @cards = CardGenerator.new('./data/cards.txt').cards))

def start
  puts "-" *75
  puts "Welcome to Flashcards! You're playing with #{@round.deck.cards.count} cards."
  until @round.deck.cards.empty? == true
    puts "-" *75
    puts "This is card number #{@round.turns.count + 1}."
    puts ">> Question: #{@round.current_card.question} <<"
    puts "-" *75
    puts "Type your answer below the line:"
    puts "-" *75
    answer = gets.chomp.upcase
    @round.take_turn(answer)
    if @round.turns.last.feedback == "Incorrect!"
      puts "#{@round.turns.last.feedback} The correct answer is: #{@round.turns.last.card.answer}"
    elsif @round.turns.last.feedback == "Correct!"
      puts "#{@round.turns.last.feedback}"
    end
  end

  def results
    puts "****** Game Over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
    @round.card_category
  end
end

start
results
