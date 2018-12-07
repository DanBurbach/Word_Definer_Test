require('word')
require('rspec')
require('pry')

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
    it("finds a word by its ID") do
      new_word1 = Define::Word.new("cat")
      new_word1.save()
      new_word2 = Define::Word.new("dog")
      new_word2.save()
      expect(Define::Word.find_word(1)).to(eq("cat"))
      expect(Define::Word.find_word(2)).to(eq("dog"))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      word = Define::Word.new("tacos")
      word.save()
      Define::Word.clear()
      expect(Define::Word.all()).to(eq([]))
    end
  end
end
