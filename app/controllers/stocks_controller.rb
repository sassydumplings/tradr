class StocksController < ApplicationController
  def index
    @user = current_user
    @stocks = current_user.stocks
    @means = current_user.stock_means

  end

  def new
    @stock = User.stocks.new
  end

  def create
    #current_user = @user
    @user = User.find(current_user.id)
    @stock = @user.stocks.new(symbol: params[:symbol], quantity: params[:quantity].to_i)
    @stock.set_price(params[:symbol])
    @stock.save

    @stocks = current_user.stocks
    @means = current_user.stock_means
  end

  def refresh_data

  
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_price(symbol)

    quote = Stockery::Quote.new

    resp = quote.get_status(symbol)

    resp[:price]

  end

  def get_profit(quantity,paid, quote)
     (quantity * quote) - (quantity * paid)
  end

  helper_method :get_price 
  helper_method :get_profit

end
