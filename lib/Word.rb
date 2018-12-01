require('pry')

module Define
  class Word
    attr_accessor :word, :definition
    attr_reader :id

    @@list = []
    @@list_defined = []
    @@list_id = []

    def initialize(word, definition)
      @word = word
      @definition = definition
      @id = @@list.length + 1
      binding.pry
    end


    def added_definition(definition)
      @list_defined.push(definition)
    end

    def self.find(id)
      item_id = id.to_i()
      @@list.each do |item|
        if item.id == item_id
          return item
        end
      end
    end

    def save()
      if @@list.find {|x| x = self} == [self]
      else
        @@list.push(self)
        @@list_id.push(self.id)
        @@list_defined.push(self)
      end
    end

    def self.wordDefinitions()
      @@list_defined = @@list.sort_by {|item| item.word}
      @@list_defined
    end

    def self.clear()
    @@list = []
    @@list_defined = []
    @@list_id = []
    end

    def self.all()
      @@list
    end
  end
end
