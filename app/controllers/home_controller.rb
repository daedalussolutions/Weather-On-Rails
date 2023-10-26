require 'net/http'

class HomeController < ApplicationController
  def index

    url = "https://api.pirateweather.net/forecast/QEoBkhPosSoMi6JID19SgnjFpVrvZnDS/43.6532%2C79.3832"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @data = JSON.parse(res.body)
  end
end

