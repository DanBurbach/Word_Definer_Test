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
    word = Define::Word.new("apple","a fruit")
    expect(word.id()).to(eq(1))
  end
end

describe(".find") do
  it("finds an item based on its id") do
    word = Define::Word.new("tacos")
    expect(word.id(1)).to(eq(1))
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
