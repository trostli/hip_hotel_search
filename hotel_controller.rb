get '/hotels/search' do
  hotel_scraper = HotelScraperApi.new
  responses = hotel_scraper.scrape_all_providers
  { results: responses }.to_json
end

