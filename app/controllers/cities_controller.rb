class CitiesController < ApplicationController

    def view
        # City.new(
        #     name: "city#{rand(10)}",
        #     landmark: "landmark",
        #     population: 25
        # ).save
        # City.new(
        #     name: "city1",
        #     landmark: "landmark",
        #     population: 25
        # ).save

        @city_name = params[:city]
        if not @city_name.nil?
            # individual city
            if not City.all.key?(@city_name.to_sym)
                @cities = nil
            else
                @cities = {@city_name => City.all[@city_name.to_sym]}
            end
        else
            # all cities
            @cities = City.all
        end
    end

    def new
        # do stuff
    end

    def update
        if request.method == "GET"
            @test = "here"
        end
    end


end
