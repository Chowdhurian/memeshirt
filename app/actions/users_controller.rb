
get '/users/new' do
  @new_user = User.new
  erb :'users/new'
end

post '/users/new' do
  @new_user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @new_user.save
    session[:user_id] = @new_user.id
    session[:flash] = "Welcome to memeshirt, #{ @new_user.email }!"
    redirect '/subscriptions/new'
  else
    session[:flash] = "Hmm...your info needs a second look: #{ display_errors(@new_user) }"
    erb :'users/new'
  end
end

get '/users/login' do
  @user = User.new
  erb :'/users/login'
end

post '/users/login' do

  @user = User.where(email: params[:email]).first

  unless @user == nil
    if @user.password == params[:password]
      # for clarity, @user is now logged in, so...
      @logged_in_user = @user
      session[:user_id] = @logged_in_user.id
      redirect '/'
    else
      session[:flash] = "Hmm...your info needs a second look: #{ display_errors(@user) }"
      erb :'users/login'
    end
  else
    session[:flash] = "Hmm...that user doesn't seem to exist."
    redirect 'users/login'
  end

end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/profile' do
  @subscription = Subscription.where(user_id: @logged_in_user.id).first
  erb :'users/profile'
end
