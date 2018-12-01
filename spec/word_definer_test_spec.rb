require('word')
require('rspec')

describe(".all") do
    it("is empty at first") do
      word = Define::Word.new("")
      definition = Define::Word.new("")
      expect(Define::Word.all()).to(eq([]))
    end
  end

describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word = Define::Word.new("apple")
      definition = Define::Word.new("a fruit")
      expect(word.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe(".find") do
      it("finds an item based on its id") do
        word = Define::Word.new("tacos")
        expect(Define::Word.find(1)).to(eq(word))
      end
    end
