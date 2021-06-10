class Api::V1::Beers::SearchController < ApplicationController
  def index
    binding.pry
    @beers = Beer.find_beers(params[:name])
    if @beers.present?
      render json: BeerSerializer.new(@beers)
    else
      render json: { errors: 'No beers found' }, status: :not_found
    end
  end
end
