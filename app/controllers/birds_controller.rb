class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    #render json: @birds
    #render json: birds, except: [:created_at, :updated_at] # for excluding certain attributes
    #OR
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #render json: {id: bird.id, name: bird.name, species: bird.species }
    #render json: bird.slice(:id, :name, :species)
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    #render json: birds, only: [:id, :name, :species] # for when there is an array of hashes

  end
end