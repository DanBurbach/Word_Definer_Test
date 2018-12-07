require('word')
require('rspec')
require('pry')

describe("Word") do

  before() do
    Word.clear()
  end

  describe("#save") do
    it("saves an item to the list of items") do
      Word.clear()
      word = Word.new({:word=> 'Red', :definition=> 'The color Red'})
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe("#clear") do
    it("clears the list of items") do
      word = Word.new({:word=> 'Red', :definition=> 'The color Red'})
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items with multiple definitions") do
      Word.clear()
      word = Word.new({:word=> 'Red', :definition=> 'The color Red'})
      word.save()
      word2 = Word.new({:word=> 'Blue', :definition=> 'The color Blue is sapphire'})
      word2.save()
      expect(Word.all()).to(eq([word, word2]))
    end
  end

  describe("#find") do
    it("saves an item to the list of items with multiple definitions") do
      Word.clear()
      word = Word.new({:word=> 'Red', :definition=> 'The color Red'})
      word.save()
      expect(Word.find(1)).to(eq(word))
    end
  end

  describe("#id") do
  it("increments an id by 1 each time a new item is added") do
    Word.clear()
    word= Word.new({:word=> "peanut", :definition=> "Elephants favorite"})
    word.save()
    word2 = Word.new({:word=> "cupcake", :definition=> "Cake in cup form"})
    word2.save()
    expect(word.id()).to(eq(1))
    expect(word2.id()).to(eq(2))
    end
  end
end
