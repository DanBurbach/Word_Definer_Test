require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @list = Define::Word.all()
  erb (:word_listing)
end

post('/new_words') do
  new_word = params["word"]
  @@new_word = Define::Word.new(new_word)
  @@new_word.save()
  @list = Define::Word.all()
  @clicked_definition = params[:definition]
  Define::Word.find(@clicked_definition)
  erb (:word_listing)
end

get('/back') do
  redirect back
end

get('/word/:id') do
  new_word = params[:word]
  @@new_word = Define::Word.new(new_word)
  @list_id = paramm[:id].to_i
  list = Define::Word.find(@list_id)
  @word = list.word
  @definition = Define:Word.all
  # word = Define::Word.find(params[:id])
  # @word = word.word.to_i
  # @definition = word.definition.to_i
  # @list_defined = Define::Word.new_entry()
  erb(:word_definition)
end

post('/word/:id') do
  word = Define::Word.find(params[:id])
  @word = word.word
  @definition = word.definition

  erb(:word_definition)
end
