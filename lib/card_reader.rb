class Cardreader

  attr_reader :question, :answer, :category

  def initialize(card_info)
    @question = card_info["question"]
    @answer = card_info["answer"]
    @category = card_info["category"]
  end
end
