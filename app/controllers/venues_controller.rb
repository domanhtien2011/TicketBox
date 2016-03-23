class VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
  end

  private

    def venue_params
      params.require(:venue).permit(:name, :full_address, :region_id)
    end
end
