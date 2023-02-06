class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json:campers, status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        render json:camper, status: :ok
    end

    def create
        camper = Camper.create(name: params[:name], age: params[:age])
        render json:camper, status: :created
    end
end
