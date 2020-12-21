class AnimalsController < ApplicationController

  # Show All
  def index 
    animals = Animal.all
    render json: animals
  end

  # Show One By ID
  def show
    animal = Animal.find(params[:id])
    render json: animal.to_json(include: :sightings)
  end

  # Create New Animal
  def create 
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: student.errors 
    end
  end

  # Update One Animal By ID
  def update 
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors 
    end
  end

  # Destroy One Animal By ID
  def destroy 
    animal = Animal.find(params[:id])
    if animal.destroy
      render json: animal
    else
      render json: animal.errors 
    end
  end


  private
  def animal_params 
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end


end
