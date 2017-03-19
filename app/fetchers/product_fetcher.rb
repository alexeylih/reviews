require 'net/http'

module ProductFetcher

class << self

    def ProductFetcher.fetch(id)
      product_json = get_product(id)
      data = parse_product(product_json, id)
      raise "Failed to fetch product wiht id: #{id}. Error returned from walmart api #{data["errors"]}" unless data["errors"].nil?
      build data
    end

    private

    def ProductFetcher.build(data)
      product = {}
      product["id"] = data.fetch("itemId").to_s
      product["name"] = data.fetch("name")
      product["salePrice"] = data.fetch("salePrice")
      product["reviews"] = data.fetch("reviews")
      product
    end

    def ProductFetcher.get_product(id)
        Net::HTTP.get(URI(api_uri(id)))
      rescue => e
        Rails.logger.error "Failed to get product with id: #{id}, #{e.message}"
        raise
    end

    def ProductFetcher.parse_product(data, id)
      JSON.parse(data)
    rescue JSON::ParserError => e
      Rails.logger.error "Failed to parse data for product with id: #{id}, #{e.message}"
      raise
    end

  end

end
