require 'typhoeus'

class HotelScraperApi

  PROVIDERS = %w(Expedia Orbitz Priceline Travelocity Hilton)

  attr_reader :errors

  def initialize
    @base_url = ENV['HOTEL_SCRAPER_URL']
    @errors
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
      if request.response.code == 200
        JSON.parse(request.response.body)["results"]
      else
        @errors << JSON.parse(request.response.body)
        nil
      end
    }

    responses.flatten.sort_by { |result| result["ecstasy"] }.reverse
  end

end