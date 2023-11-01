class HomeController < ApplicationController
  def location
    respond_to do |format|
      format.html # location.html.erb
      format.json { render json: @place }
      
      latitude, longitude = params[:place].split(',')
      
      @response = Geocoder.search(params[:place].split(',')).first
      puts @response.city if @response.present?
      puts @response.province if @response.present?
      puts @response.country if @response.present?

      puts "Latitude: #{latitude}"
      puts "Longitude: #{longitude}"
      
      @data = CurrentWeatherService.new(latitude: latitude, longitude: longitude, units: "metric").call
    end
  end
  def search
    location = params[:search]

    if location.present?
      result = Geocoder.search(params[:search]).first.coordinates
      if result
        redirect_to location_path(place: "#{result.first},#{result.second}")
      else
        flash[:error] = "Location not found"
        redirect_to root_path
      end
    end
  end
  def index
      @response = Geocoder.search("43.6532,-79.3832").first
      @data = CurrentWeatherService.new(latitude: "43.6532", longitude: "-79.3832", units: "metric").call
  end

end

