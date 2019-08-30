class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    # the above is the same as writing
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, except: [:created_at, :updated_at]

      # render json: bird.slice(:id, :name, :species)
      # first way is better
    else
      render json: { message: 'Bird not Found' }
    end
  end
end