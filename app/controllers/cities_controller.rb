class CitiesController < ApplicationController

    def view
        # City.new(
        #     name: "city#{rand(10)}",
        #     landmark: "landmark",
        #     population: 25
        # ).save
        # City.new(
        #     name: "Berkeley",
        #     landmark: "landmark",
        #     population: 25
        # ).save

        @city_name = params[:city]
        if not @city_name.nil?
            # individual city
            if not City.all.key?(@city_name.to_sym)
                @notice = "Your query city wasn't in our database."
                @cities = City.all
            else
                @cities = {@city_name => City.all[@city_name.to_sym]}
            end
        else
            # all cities
            @cities = City.all
        end
    end

    def new
        @params = params
        @method = request.method
        # do stuff
    end

    def create
        # create city
        name = params[:name]
        landmark = params[:landmark]
        population = params[:population]
        if name.nil? or name.empty?
            name = "No city name"
        end
        if landmark.nil? or landmark.empty?
            landmark = "No landmark given"
        end
        if population.nil? or population.empty?
            population = "No population given"
        end
        if not City.all.key?(name.to_sym)
            City.new(
                name: name,
                landmark: landmark,
                population: population
            ).save
        end
        redirect_to :action => "view"
    end


    def update_form
        @city = params[:city]
        render :update
    end

    def update
        city = params[:city]
        if City.all.key?(city.to_sym)
            City.all[city.to_sym].update(params)
        end
        redirect_to :action => "view"
    end


end
