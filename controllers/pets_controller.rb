class PetsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/pets' do

  @pets = Pet.all

  erb :'pets/index'

  end

  get '/pets/new'  do

  # create an empty user
  @pet = Pet.new

  erb :'pets/new'

  end

  get '/pets/:id' do

  # get the ID and turn it in to an integer
  id = params[:id].to_i

  # make a single user object available in the template
  @pet = Pet.find id

  erb :'pets/show'

  end

  get '/pets' do

  pet = Pet.new

  # bind the values
  pet.name = params[:name]
  pet.colour = params[:colour]

  # save the user
  pet.save

  redirect "/pets"

  end

  put '/pets/:id'  do

  # data is gathered in the params object
  id = params[:id].to_i

  # load the object with the id
  pet = Pet.find id

  # update the values
  pet.name = params[:name]
  pet.colour = params[:colour]

  # save the user
  pet.save

  # redirect the user to a GET route. We'll go back to the INDEX.
  redirect "/pets";

  end

  delete '/pets/:id'  do

  id = params[:id].to_i


  Pet.destroy id

  redirect "/pets"

  end

  get '/pets/:id/edit'  do

  # get the ID and turn it in to an integer
  id = params[:id].to_i

  # make a single user object available in the template

  @pet = Pet.find id

  erb :'pets/edit'

  end

end
