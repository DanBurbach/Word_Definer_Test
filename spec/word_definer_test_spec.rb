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
  it("finds a word by its ID") do
    new_word = Define::Word.new("cat")
    new_word.save()
    next_word = Define::Word.new("dog")
    next_word.save()
    final_word = Define::Word.new("mongoose")
    final_word.save()
    expect(Define::Word.find).to(eq(1))
    expect(Define::Word.find).to(eq(2))
    Define::Word.clear
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
