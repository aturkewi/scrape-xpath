class GrouponConnection

  attr_reader :connection

  def initialize
    @connection = self.class
  end

  # page.xpath("//ul[@class='multi-option-breakout']/li/label/input/div/p/span")

  def get_prices_and_quantity(url)
    page = get_page(url)
    prices = get_prices(page)
    quantites = get_quanitity(page)
    {prices: prices, quantites: quantites}
  end

  def get_page(url)
    Nokogiri::XML(open(url))
  end

  def get_prices(page)
    price_nodes = page.xpath("//ul[@class='multi-option-breakout']//li//div//span[1]")
    price_nodes.collect do |node|
      node.text.gsub(/[^\d]/,'').to_i
    end[0,2]
  end

  def get_quanitity(page)
    quantity_nodes = page.xpath("//p[@class='breakout-sold-message']")
    quantity_nodes.collect do |node|
      node.text.gsub(/[^\d]/,'').to_i
    end
  end

end
