
class CardGenerator

  def initialize(file_path)
    @file_path = file_path
  end

  def cards
    game = []
      File.open(@file_path, headers: true).drop(1).each do |row|
          info = row.chomp.split(',')
          question = info[0]
          answer = info[1]
          category = info[2].to_sym
          game << Card.new(question, answer, category)
        end
        game
      end
  end
