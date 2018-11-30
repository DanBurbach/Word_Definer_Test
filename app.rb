require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')

get('/') do
  Word.clear()
  @list = Word.all()
  @defined_list = Word.wordDefinitions()
  erb(:word_definition.erb)
end

post('/') do
  @new_word = Word.new(params.fetch("name,"), params.fetch("definition"))
  @new_word.save()
  @list = Word.all()
  @defined_list = Word.wordDefinitions()
  erb(:word_definition)
end
