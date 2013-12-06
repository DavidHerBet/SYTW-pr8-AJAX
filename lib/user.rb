require 'dm-core'
require 'dm-migrations'
require 'sinatra/flash'

# Modelo de la base de datos de usuarios
class User
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :password, String
  property :games, Integer
  property :won_games, Integer
  property :lost_games, Integer
  property :tied_games, Integer
end

DataMapper.finalize

# Carga la lista de usuarios y sus partidas
get '/users' do
  @users = User.all
  haml :users
end

# Carga el formulario para la creación de un nuevo usuario
get '/users/new' do
  haml :new_user
end

# Carga los datos del usuario creado
get '/users/:id' do |id|
  @user = User.get(id)
  haml :show_user
end

# Crea el usuario en la base de datos siempre que sea posible
# Si el usuario ya existe, o si el username o password están
# vacíos, devuelve un mensaje de error mediante el flash de
# sinatra
post '/users' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    flash[:error] = "Error: The user or the password field is empty"
    redirect to ('/users/new')
  elsif User.first(:username => "#{params[:user][:username]}")
    flash[:error] = "The user has been already created"
    redirect to ('/users/new')
  else
    params[:user]["games"] = 0
    params[:user]["won_games"] = 0
    params[:user]["lost_games"] = 0
    params[:user]["tied_games"] = 0
    user = User.create(params[:user])
    flash[:success] = "User created successfully"
    flash[:login] = "Login successfully"
    session["user"] = "#{params[:user][:username]}"
    redirect to("/users/#{user.id}")
  end
end

# Carga el formulario de edición del usuario
# get '/users/:id/edit' do
#   @user = User.get(params[:id])
#   haml :edit_user
# end

# Actualiza los datos de un usuario
# put 'users/:id' do
#   user = User.get(params[:id])
#   user.update(params[:user])
#   redirect to("/users/#{user.id}")
# end

# Borra los datos de un usuario
# delete '/users/:id' do
#   User.get(params[:id]).destroy
#   redirect to('/users')
# end
