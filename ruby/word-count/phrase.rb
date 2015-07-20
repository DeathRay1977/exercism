class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/[\w']+/)
  end

  def word_count
    @words.each_with_object({}) { |word, count| count[word] = count[word]+1}
  end
end
