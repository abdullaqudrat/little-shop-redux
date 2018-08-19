class LittleShopApp < Sinatra::Base
  set :method_override, true

  # ----Merchant Controllers---- #

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    merchant = Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  # ----Item Controllers---- #

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :"items/new"
  end

  post '/items' do
    Item.create(params[:item])
    redirect "/items"
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect "/items"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @merchant = @item.merchant
    erb :"items/show"
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :"items/edit"
  end

  # ----Invoice Controllers---- #
end
