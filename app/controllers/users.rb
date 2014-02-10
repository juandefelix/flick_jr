# ========= #
# U S E R S #
# ========= #
get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  @error = 'Successfully logged out'
  erb :error
end

# renders the template for a user to login
get '/userlogin' do
  erb :login
end
# returns to the home page with a user logged in
get '/login' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  # binding.pry
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :error
  end
end

post '/user/new' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  user = User.create(:name => name,
              :email => email,
              :password => password)
  session[:user_id] = user.id
  redirect '/'
end

get '/user/:id' do
  name =User.find(params[:id]).name
  "#{name}"'s Profile'
end
