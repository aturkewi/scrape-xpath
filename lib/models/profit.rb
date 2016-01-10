class Profit

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def earnings
    prices_and_quantity = GrouponConnection.new.get_prices_and_quantity(url)
    prices_and_quantity.inject(0) do |sum, hash|
      sum + hash[:price]*hash[:quantity]
    end
  end
end
