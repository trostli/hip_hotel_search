# A Hip Hotel Search

A basic solution for [this challenge](https://github.com/Hipmunk/hipproblems/tree/master/hotel_search)

Uses the Sinatra web framework for Ruby. Passes all tests when you run from the hotel_search repo:
``` 
python -m hotel_search.scraperapi_test 
```

## Installation

Require Ruby 2.2 or greater.

To run:
```
gem install bundler
bundle install
bundle exec shotgun app.rb -p 8000
```

The server should then be running on port 8000.

## Improvements necessary for a production environment

- [ ] Cache the response in Redis or Memcached for the '/hotels/search' endpoint for up to 1 to 5 seconds. Long enough to really speed things up when there is load on the server, but not long enough to have (hopefully) stale results.
- [ ] Tune Puma web server with the right number of threads to optimize memory usage in whatever server environment we've deployed to.
- [ ] A test suite that stubs out the response from the Provider api's. Can use a Gem like VCR to record and playback their responses in a reliable fashion. The test suite would ensure completeness of result as well as its sorting by ecstasy.