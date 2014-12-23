require 'cuba'
require 'json'
require 'time'
require '../src/service/weather/forecast'

Cuba.define do
  on get do

    on root do
      res.write "Hello claudiu"
    end
    on 'weather' do
      res.write JSON.generate(Weather.new.get_weather)
    end

    on 'w/:city' do |city|
      res.write JSON.generate(Weather.new.get_weather_for(city))
    end
  end
end
