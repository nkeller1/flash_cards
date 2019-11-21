
class CardGenerator

  def initialize(file_path)
    @file_path = file_path
  end

  def cards
    game = []
      File.open(@file_path, headers: true) do |row|
        row.to_a[1..-1].each do |card_info|
          info = card_info.chomp.split(',')
          question = info[0]
          answer = info[1]
          category = info[2].to_sym
          game << Card.new(question, answer, category)
        end
      end
    game
  end
end
