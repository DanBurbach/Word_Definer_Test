require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @list = Define::Word.all()
  @list_defined = Define::Word.word_sort()
  Define::Word.clear()
  erb (:word_listing)
end

post('/') do
  @new_word = Define::Word.new(params.fetch("word"), params.fetch("definition"))
  @new_word.save()
  @list_defined = Define::Word.word_sort()
  erb (:word_listing)
end

get('/list_defined') do
  erb(:word_listing)
end

get('/word/:id') do
  word = Define::Word.find(params[:id])
  @word = word.word
  definition = Define::Word.find(params[:id])
  @definition = word.definition
  @list_defined = Define::Word.word_sort()
  erb(:word_definition)
end

post('/word/:id') do
  word = Define::Word.find(params[:id])
  @word = word.word
  @definition = word.definition
  erb(:word_definition)
end
