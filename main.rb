require 'sinatra'
require 'haml'
require 'sass'
require './lib/tictactoe'
require './lib/user'

# Habilita las sesiones
# enable :sessions
use Rack::Session::Pool, :expire_after => 2592000
set :session_secret, 'super secret'

# Setup para el desarrollo
configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

# Setup para la producción
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

# Se encarga de crear el esquema de la base de datos basándose
# en el modelo. Crea nuevas tablas y añade columnas a tablas
# existentes. Pero no cambia ni elimina ninguna columna, a 
# diferencia de auto_migrate!, que te crea la base de datos
# de nuevo y vacío
DataMapper.auto_upgrade!

# Carga el formulario para logearse
get '/login' do
  haml :login
end

# Realiza el login comprobando que el nombre de usuario y contraseña
# introducidos son los correctos. Si el usuario y contraseña no están
# rellenos, o no han sido creados en la base de datos, devuelve error
# mediante el flash de sinatra; si no es así, crea la sesión
# agregando el atributo user en el hash de session, con el username
# del usuario que ha realizado el login
post '/login' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    flash[:error] = "Error: The user or the password field is empty"
    redirect to ('/login')
  elsif User.first(:username => "#{params[:user][:username]}", :password => "#{params[:user][:password]}")
    flash[:login] = "Login successfully"
    session["user"] = "#{params[:user][:username]}"
    puts session["user"]
    redirect to ('/')
  else
    flash[:error] = "The user doesn't exist or the password is invalid"
    redirect to("/login")
  end
end

# Realiza el logout del usuario, eliminando el atributo user
# de la session
get '/logout' do
  session.delete("user")
  flash[:logout] = "Logout successfully"
  redirect to ('/')
end

# Carga las hojas de estilo generadas mediante sass
get '/styles.css' do
  scss :styles
end
