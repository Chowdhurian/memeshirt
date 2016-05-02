get '/subscriptions/new' do
  @new_subscription = Subscription.new

  if @logged_in_user
    erb :'subscriptions/new'
  else
    session[:flash] = "We're happy you're excited. Let's make an account."
    redirect '/users/new'
  end
end

post '/subscriptions/new' do
  @new_subscription = Subscription.new(
    user_id: session[:user_id],
    gender: params[:gender],
    size: params[:size],
    address: params[:address],
    city: params[:city],
    country: params[:country],
    postal_code: params[:postal_code]
  )

  if @new_subscription.save
    session[:flash] = "Success! Let there be memes on your shirt."
    redirect '/subscriptions/charge'
  else
    session[:flash] = "Hmm...your info needs a second look: #{ display_errors(@new_subscription) }"
    erb :'subscriptions/new'
  end
end

get '/subscriptions/update' do
  @subscription = Subscription.where(user_id: @logged_in_user.id).first
  erb :'/subscriptions/update'
end

post '/subscriptions/update' do
  subscription = Subscription.where(user_id: @logged_in_user.id).first
  subscription.update(
    gender: params[:gender],
    size: params[:size],
    address: params[:address],
    city: params[:city],
    country: params[:country],
    postal_code: params[:postal_code]
  )

  redirect '/users/profile'
end

post '/subscriptions/cancel' do
  subscription = Subscription.where(id: params[:subscription_id]).first
  subscription.delete
  redirect '/users/profile'
end
