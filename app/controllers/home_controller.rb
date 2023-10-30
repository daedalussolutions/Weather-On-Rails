class HomeController < ApplicationController
  def location
    respond_to do |format|
      format.html # location.html.erb
      format.json { render json: @place }
      
      latitude, longitude = params[:place].split(',')

      puts "Latitude: #{latitude}"
      puts "Longitude: #{longitude}"
      
      @data = CurrentWeatherService.new(latitude: latitude, longitude: longitude, units: "metric").call
    end
  end
  def index
      @data = CurrentWeatherService.new(latitude: "43.6532", longitude: "-79.3832", units: "metric").call
  end

end

