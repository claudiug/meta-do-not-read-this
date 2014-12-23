require 'forecast_io'
require 'geocoder'

ForecastIO.api_key = '7ad69e74eb23f877270fa35ddfd82dbc' #key

class Weather

  def get_weather
    result = Geocoder.search('Berlin')[0].data['geometry']['bounds']['northeast']
    ForecastIO.forecast(result['lat'], result['lng'], params: { units: 'si', exclude: 'minutely,flags,alerts,hourly'})
  end

  def get_weather_for(city = nil)
    if city.nil?
      return { message: 'No city provided'}
    end
    begin
      result = Geocoder.search(city)[0].data['geometry']['bounds']['northeast']
      return ForecastIO.forecast(result['lat'], result['lng'], params: { units: 'si', exclude: 'minutely,flags,alerts,hourly'})
    rescue NoMethodError => e
      return {error: e.message}
    end
  end
end
