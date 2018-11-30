require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  Word.clear()
  @list = Word.all()
  @list_defined = Word.wordDefinitions()
  erb (:word_definition)
end

post('/') do
  @new_word = Word.new(params.fetch("word"), params.fetch("definition"))
  @new_word.save()
  @list = Word.all()
  @list_defined = Word.wordDefinitions()
  erb (:word_definition)
end
