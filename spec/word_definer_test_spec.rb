require('item')
require('rspec')

describe(Word) do
  describe('.wordDefinitions') do
    it('sorts our list of items by name') do
      new_item = Word.new("gate", "a hinged barrier used to close an opening in a wall, fence, or hedge.").save
      new_item = Word.new("apple", "the round fruit of a tree of the rose family, which typically has thin red or green skin and crisp flesh. Many varieties have been developed as dessert or cooking fruit or for making cider.
").save
      new_item = Word.new("cheese", "a food made from the pressed curds of milk.").save
      expect(Word.wordDefinitions).to(eq(""))
    end
  end
end
