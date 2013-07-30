class Stock < ActiveRecord::Base
  belongs_to :user
  attr_accessible :quantity, :starting_price, :symbol, :user_id


  def set_price(symbol)
    #quote = StockQuote::Stock.quote(symbol)

    quote = Stockery::Quote.new

    resp = quote.get_status(symbol)
    #self.starting_price = quote.last

    self.starting_price = resp[:price]

    
  end
end
