class Acronym
  def self.abbreviate(phrase)
    tla = ""
    each_word(phrase) do |word|
      tla << word[0]
    end
    tla.upcase
  end

  private
  def self.each_word(phrase)
    phrase.scan(/[A-Z]+[a-z]*|[a-z]+/) do |word|
      yield word
    end
  end

end

