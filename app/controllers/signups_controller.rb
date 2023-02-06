class SignupsController < ApplicationController

    def create
        signup = Signup.create(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        render json: signup.activity, status: :created
    end
end
