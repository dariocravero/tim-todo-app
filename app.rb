require 'sinatra'

class Todo
  attr_accessor :content, :complete

  def initialize(content, complete=false)
    @content  = content
    @complete = complete
  end

  def complete?
    @complete
  end

  ##
  #
  def toggle_complete!
  end
end

todos = [
  Todo.new('Do this!', true),
  Todo.new('Do that!'),
  Todo.new('Do the other thing!')
]

get '/' do
  @todos = todos

  erb :todos
end

# should be a post
get '/completed' do
  index = params[:i].to_i
  # TODO
  # Write a #toggle_complete! in Todo that
  # would toggle the value of the complete variable

  # to replace this:
  todos[index].complete = !todos[index].complete
  # for this:
  # todos[index].toggle_complete!

  redirect '/'
end

post '/new' do
  content = params[:content]
  todo    = Todo.new(content)
  todos   << todo

  redirect '/'
end
