class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  has_many :stocks

  def stock_means
  	stocks = self.stocks

    result = Hash.new
  	stocks.each do |stock| 
  		if result.has_key?(stock.symbol)
  			old_quantity = result[stock.symbol][:quantity].to_i
  			old_mean = result[stock.symbol][:mean_price]
  			old_total = old_quantity * old_mean

  			new_quantity = old_quantity + stock.quantity
  			new_mean = (old_total + (stock.starting_price * stock.quantity))/(old_quantity + stock.quantity)

  			result[stock.symbol] = {quantity: new_quantity, mean_price: new_mean}

  		else
  			result[stock.symbol] = {quantity: stock.quantity, mean_price: stock.starting_price}
  		end

  	end

  	result
  end
end