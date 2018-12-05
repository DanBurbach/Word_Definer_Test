require('pry')

module Define
  class Word
    attr_accessor :word, :definition
    attr_reader :id

    @@word_list = []
    @@word_defined = []
    @@word_id = []

    def initialize(word)
      @word = word
      @definition = []
      @id = @@word_list.length + 1
    end

    def self.all()
      @@word_list
    end

    def self.all_words
      @@word_defined
    end

    def self.all_word_ids()
      @@word_id
    end

    def saved_definition(definition)
      @definition.push(definition)
    end

    def self.find(id)
      @@word_defined[id.to_i - 1]
    end

    def self.find_word(id)
      @@word_list.each do |item|
        if item.id == id
          return item.word
        end
      end
    end

    def save()
      @@word_list.push(self)
    end

    def self.words_sorted()
      @@word_defined = @@word_defined.sort_by {|item| item.word}
    end

    def self.clear()
      @@word_list = []
      @@word_defined = []
      @@word_id = []
    end

  end
end
