
class CardGenerator

  # attr_reader :cards
  #
  def initialize(cards)
  #   @cards = cards
  end

  def cards(file_path)
    game = []
      File.foreach("#{file_path}", headers: true) do |row|
        game << Cardreader.new(row)
      end
    game
  end

  # def card
  #   File.open("#{file_path}", "r") do |row|
  #     row.each_line do |line|
  #     puts line
  #     end
  #   end
  # end
end
