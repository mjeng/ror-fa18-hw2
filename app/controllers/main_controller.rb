require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    @city = params[:city]
    @w = WeatherService.get(@city)
    if not @w.nil?
        @temp = @w[:temperature] - 273
        @description = @w[:description]
    end

    city = City.new(
        name: "city",
        description: "bllleeeh",
        temperature: 1
    )
    city.save

  end

end
