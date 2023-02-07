class SignupsController < ApplicationController
wrap_parameters format: []
# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    # def create
    #     signup = Signup.create!(signup_params)
    #     render json: signup.activity, status: :created
        
    # end
    
    def create
        signup = Signup.create(signup_params)
        
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { "errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end


    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    # def render_unprocessable_entity(invalid)
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    # end
end
