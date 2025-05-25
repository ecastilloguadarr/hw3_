class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    # your new action code
  end

  def create
    new_place = Place.new
    new_place["name"] = params["place"]["name"]
    new_place.save
    redirect_to "/places"
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end
end
