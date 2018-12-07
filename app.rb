require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @word = Word.all()
  erb (:word_listing)
end

post('/wordlist') do
  word = params.fetch('word')
  definition = params.fetch('definition')
  new_defined_word = Word.new({:word => word, :definition => definition, :id => nil})
  new_defined_word.save()
  @word = Word.all()
  erb (:word_listing)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word_definition)
end

post('/word/:id') do
  definition = params['definition']
  @word = Word.find(params[:id].to_i)
  @word.add_definition(definition)
  erb(:word_definition)
end
