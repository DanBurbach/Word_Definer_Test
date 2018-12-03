require('pry')

module Define
  class Word
    attr_accessor :word, :definition
    attr_reader :id

    @@list = []
    @@list_id = []
    @@list_defined = []

    def initialize(word, definition)
      @word = word
      @definition = definition
      @id = @@list.length + 1
    end

    def added_definition(definition)
      @definition.push(definition)
    end

    def self.find(id)
      @@list[id.to_i - 1]
    end

    def save()
      @@list.push(self.word, self.definition)
      @@list_id.push(self.id)
      @@list_defined.push(self)
    end

    def self.word_sort
      @@list_defined = @@list.sort_by {|item| item.word}
      @@list_defined
    end

    def self.all_words
      @@list_defined
    end

    def self.clear()
      @@list = []
      @@list_defined = []
      @@list_id = []
    end

    def self.all()
      @@list
      @@list_defined
      @@list_id
    end

  end
end
