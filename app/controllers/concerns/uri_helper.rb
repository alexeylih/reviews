module UriHelper

  def self.get_product_id_from_uri(uri_s)
    uri = URI(uri_s)
    puts uri.hostname
    raise "Not a wallmart product url" unless uri.hostname.include? "walmart"
    uri.path.split("/").last
  end
end
