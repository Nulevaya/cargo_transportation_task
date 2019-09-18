class CitiesController < ApplicationController
  def index
    @cities = City.by_departure.limit(3)
  end
end
