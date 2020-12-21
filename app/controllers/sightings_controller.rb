class SightingsController < ApplicationController

# Show All
def index 
  sightings = Sighting.where(start_date: params[:start_date], end_date: params[:end_date])
  render json: sightings
end

# Show One By ID

# Create New Sighting

# Update One Sighting By ID

# Destroy One Sighting By ID

private
def sighting_params
  params.require(:sighting).permit(:date, :lat, :lng, :animal_id)
end

end
