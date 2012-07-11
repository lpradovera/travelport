module Travelport::Model
  class Price

    attr_accessor :currency, :amount

    def initialize(price)
      self.price= price
    end

    def price=(price)
      @currency, @amount = price[0..2], price[3..-1].to_f
    end

    def price
      "#{@currency}#{amount}"
    end
  end
end