class LittleShopApp < Sinatra::Base
  set :method_override, true

  # ----Dashboard Controllers---- #
  get '/items-dashboard' do
    erb :"dashboards/items-dashboard"
  end

  get '/invoices-dashboard' do
    @invoices = Invoice.all
    erb :"dashboards/invoices-dashboard"
  end
  
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
  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end

  put '/invoices/:id' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{id}"
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect "/invoices"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
    @invoice_items = InvoiceItem.where(invoice_id: @invoice.id)
    erb :"invoices/show"
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    @merchants = Merchant.all
    @invoices = Invoice.all
    erb :"invoices/edit"
  end
end
