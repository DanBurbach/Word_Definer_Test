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
  it("gives entry an id number") do
    word1 = Define::Word.new("apple","a fruit")
    expect(word1.id()).to(eq(1))
  end
end

describe(".find") do
  it("finds an item based on its id") do
    word = Define::Word.new("tacos")
    expect(Define::Word.find(1)).to(eq(word))
  end
end
