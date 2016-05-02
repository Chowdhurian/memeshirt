require './app/actions/users_controller.rb'
require './app/actions/subscriptions_controller.rb'

helpers do
  def new_meme
    Meme.all.sample.url
  end

  def find_user(subscription)
    user = User.where(id: subscription).first
    if user
      user.email
    end
  end

  def order_meme
    new_id = Meme.all.sample.id
    unless Order.where(subscription_id: @subscription[0].id, meme_id: new_id).empty?
      order_meme
    end
    new_id
  end

  def user_subscription
    @subscription = Subscription.where(user_id: @logged_in_user.id)
  end

  # note to self: make dry
  def gender_placeholder_female
    if @new_subscription.gender == "female"
      "checked='checked'"
    end
  end

  def gender_placeholder_male
    if @new_subscription.gender == "male"
      "checked='checked'"
    end
  end

  def size_placeholder_small
    if @new_subscription.size == "small"
      "checked='checked'"
    end
  end

  def size_placeholder_medium
    if @new_subscription.size == "medium"
      "checked='checked'"
    end
  end

  def size_placeholder_large
    if @new_subscription.size == "large"
      "checked='checked'"
    end
  end

  def has_flash?
    session[:flash] != nil
  end

  def flash
    to_be_flashed = session[:flash]
    session[:flash] = nil
    to_be_flashed
  end

  def display_errors(object)
    object.errors.full_messages.inject do |error_text, error|
      error_text + ", " + error
    end
  end

end

before do
  @logged_in_user = nil

  if session[:user_id]
    @logged_in_user = User.find(session[:user_id])
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/admin' do
  @users = User.all
  @subscriptions = Subscription.all
  if @logged_in_user && @logged_in_user.admin?
   erb :'/users/admin'
  end
end

get '/new_meme' do
  content_type :json
  {meme_url: new_meme}.to_json
end

get '/subscriptions/charge' do
  erb :'subscriptions/charge'
end

post '/subscriptions/charge' do
  # Amount in cents
  @amount = 2500
  customer = Stripe::Customer.create(
    email: @logged_in_user.email,
    card:  params[:stripeToken]
  )

  @logged_in_user.stripe_token = params[:stripeToken]

  charge = Stripe::Charge.create(
    amount:      @amount,
    description: 'Sinatra Charge',
    currency:    'usd',
    customer:    customer.id
  )

  redirect :'/subscriptions/success'
end

get '/subscriptions/success' do
  user_subscription
  new_order = Order.new(
    meme_id:          order_meme,
    subscription_id:  @subscription[0].id,
    gender:           @subscription[0].gender,
    size:             @subscription[0].size,
    address:          @subscription[0].address,
    city:             @subscription[0].city,
    country:          @subscription[0].country,
    postal_code:      @subscription[0].postal_code
  )
  new_order.save
  erb :'/subscriptions/success'
end

get '/users/profile' do
  user_subscription
  erb :'/users/profile'
end
