require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')


get('/') do
  @list = Define::Word.all()
  @list_defined = Define::Word.wordDefinitions()
  Define::Word.clear()
  erb (:word_listing)
end

post('/') do
  @new_word = Define::Word.new(params.fetch("word"), params.fetch("definition"))
  @new_word.save()
  @list = Define::Word.all()
  @list_defined = Define::Word.wordDefinitions()
  erb (:word_listing)
end

get('/word/:id') do
  word = Define::Word.find(params[:id])
  @word = word.word
  @definition = word.definition
  erb(:word_definition)
end

post('/word/:id') do
  word = Define::Word.find(params[:id])
  @word = word.word
  @definition = word.definition
  erb(:word_definition)
end
