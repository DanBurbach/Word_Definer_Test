require('pry')

class Word
  attr_accessor :word, :definition
  @@list = []
  @@list_defined = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def self.all()
    @@list
  end

  def save()
    if @@list.find {|x| x = self} == [self]
    else
      @@list.push(self)
    end
  end

  def self.wordDefinitions()
    @@list_defined = @@list.sort_by {|item| item.word}
    @@list_defined
  end

  def self.clear()
  @@list = []
  end
end
