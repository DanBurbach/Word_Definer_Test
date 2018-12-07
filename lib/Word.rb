require('pry')
  class Word
    attr_accessor :word, :definition
    attr_reader :id

    @@list = []

    def initialize(attributes)
      @word = attributes.fetch(:word)
      @definition = [attributes.fetch(:definition)]
      @id = @@list.length + 1
    end

    def self.all
      @@list
    end

    def add_definition(definitions)
      @definition.push(definitions)
    end

    def self.find(id)
      word_id = id.to_i
      @@list.each do |word|
        if word.id == word_id
          return word
        end
      end
    end

    def save()
      @@list.push(self)
    end

    def self.clear()
      @@list = []
    end

end
