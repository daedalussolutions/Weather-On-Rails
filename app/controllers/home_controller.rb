class HomeController < ApplicationController
  def index
    @data = CurrentWeatherService.new(latitude: "43.6532", longitude:"79.3832", units:"metric").call
  end
end

