require('pry')

class Word
  attr_accessor :name :definition
  @@list = []
  @@list_defined = []

  def initialize(name, definition)
    @name = name
    @definition = definition
  end

  def self.all()
    @@definition
  end

  def save()
    if @@list.find {|x| x = self} == [self]
    else
      @@list.push(self)
    end
  end

  def self.wordDefinitions()
    @@list_defined = @@list.sort_by {|item| time.name}
    @@ranked_list
  end

  def self.clear()
  @@list = []
  end
end
