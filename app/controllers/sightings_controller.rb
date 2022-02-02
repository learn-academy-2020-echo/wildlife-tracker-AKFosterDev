class SightingsController < ApplicationController

# Show All
def index
  sightings = Sighting.where(date: params[:start_date]..params[:end_date])
  render json: [Sighting.all, sightings]
end

# Show One By ID
def show
  sighting = Sighting.find(params[:id])
  render json: sighting
end

# Create New Sighting
def create 
  sighting = Sighting.create(sighting_params)
  if sighting.valid?
    render json: sighting
  else
    render json: { message: 'Validation Failed', errors: sighting.errors }, status: 422
  end
end


# Update One Sighting By ID
def update
  sighting = Sighting.find(params[:id])
  sighting.update(sighting_params)
  if sighting.valid?
    render json: sighting 
  else
    render json: sighting.errors 
  end
end

# Destroy One Sighting By ID
def destroy 
  sighting = Sighting.find(params[:id])
  if sighting.destroy
    render json: sighting
  else
    render json: sighting.errors 
  end
end

private
def sighting_params
  params.require(:sighting).permit(:date, :lat, :lng, :animal_id, :start_date, :end_date)
end

end
