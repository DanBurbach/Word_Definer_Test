require('word')
require('rspec')

 describe(Define::Word) do
   describe('.wordDefinitions') do
     it('sorts our list of items by name') do
       new_item = Define::Word.new("gate", "a hinged barrier").save
       new_item = Define::Word.new("apple", "a fruit").save
       new_item = Define::Word.new("cheese", "a food made from the pressed curds of milk.").save
       expect(Define::Word.wordDefinitions).to(eq("apple""a fruit""cheese""a food made from the pressed curds of milk""gate""a hinged barrier"))
     end
   end
 end
