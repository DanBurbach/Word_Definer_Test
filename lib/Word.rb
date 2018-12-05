require('pry')

module Define
  class Word
    attr_accessor :word, :definition
    attr_reader :id

    @@word_list = []

    def initialize(word)
      @word = word
      @definition = []
      @id = @@word_list.length + 1
    end

    def self.all()
      @@word_list
    end

    def saved_definition(definition)
      @definition.push(definition)
    end

    def self.find(id)
      @@list[id.to_i - 1]
    end

    def save()
      @@word_list.push(self)
    end

    def self.words_sorted()
      @@list_defined = @@list.sort_by {|item| item.word}
      @@list_defined
    end

    def self.clear()
      @@word_list = []
    end

  end
end
