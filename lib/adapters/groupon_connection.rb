class GrouponConnection

  attr_reader :connection

  def initialize
    @connection = self.class
  end

  def get_page(url)
    Nokogiri::HTML(open(url))
  end

end
