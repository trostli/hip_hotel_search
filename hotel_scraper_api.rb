require 'typhoeus'

class HotelScraperApi

  PROVIDERS = %w(Expedia Orbitz Priceline Travelocity Hilton)

  def initialize
    @base_url = ENV['HOTEL_SCRAPER_URL']
  end


  def scrape_all_providers
    hydra = Typhoeus::Hydra.new
    requests = PROVIDERS.map do |provider|
      request = Typhoeus::Request.new("#{@base_url}/#{provider}", followlocation: true)
      hydra.queue(request)
      request
    end

    hydra.run

    responses = requests.map { |request|
      JSON.parse(request.response.body)["results"]
    }

    responses.flatten.sort_by { |result| result["ecstasy"] }.reverse
  end

end