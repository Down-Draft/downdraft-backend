class Api::V1::ElevationController < ApplicationController
  def index
    if Geocoder.search(params[:location]) == []
      render json: { errors: "Location not found" }, status: :not_found
    else
      coordinates = Geocoder.search(params[:location]).first.coordinates
      elevation = ElevationService.fetch_elevation(coordinates[0], coordinates[1])
      poro = Elevation.new(elevation)
      render json: ElevationSerializer.new(poro)
    end
  end
end
