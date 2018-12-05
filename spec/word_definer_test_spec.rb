require('word')
require('rspec')

describe("Define::Word") do

  before() do
    Define::Word.clear()
  end

  describe(".all") do
    it("is empty at first, and is open to be filled") do
      expect(Define::Word.all()).to(eq([]))
    end
  end

  describe("#saved_word") do
    it("saves a new word") do
      new_word = Define::Word.new("apple")
      new_word.save()
      expect(Define::Word.all()).to(eq([new_word]))
    end
  end

  describe("#saved_definition") do
    it("adds a definition") do
      new_word = Define::Word.new("apple")
      new_word.save()
      new_word.saved_definition("a red tasty sweet crisp snack")
      expect(new_word.saved_definition("a fruit")).to(eq(["a red tasty sweet crisp snack", "a fruit"]))
    end
  end

  describe(".find") do
  it("finds an item based on id") do
    new_word = Define::Word.new("cat")
    new_word.save()
    next_word = Word.new("dog")
    next_word.save()
    expect(Define::Word.find(1)).to(eq(1))
    expect(Define::Word.find(2)).to(eq(2))
  end
end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos")
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end
end
