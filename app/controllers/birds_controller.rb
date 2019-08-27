class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

    def show
    birds = Bird.find_by(id: params[:id])
    #render json: bird
    #render json: {id: bird.id, name: bird.name, species: bird.species } 
    #render json: bird.slice(:id, :name, :species)
    render json: birds, only: [:id, :name, :species]
  end
end