class SignupsController < ApplicationController
wrap_parameters format: []

### OPTION 1 FOR ERROR HANDLING ###

# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    # def create
    #     signup = Signup.create!(signup_params)
    #     render json: signup.activity, status: :created        
    # end

# THE "!" IN THE .CREATE METHOD MAKES THE METHOD RETURN A "RECORDINVALID" ERROR. THIS ALLOWS FOR THE RESCUE_FROM TO BE ENVOKED ABOVE, AND CALL TO THE RENDER_UNPROCESSABLE_ENTITY MESSAGE IN THE PRIVATE SECTION   


### OPTION 2 FOR ERROR HANDLING ###

# THE IF/ELSE STATEMENT BELOW, WITH THE OMISION OF THE "!" WILL HAVE THE SAME EFFECT. IT IS NOT THE BEST WAY TO WRITE CONDITIONAL CODE IN TERMS OF CODE PERFORMANCE, AND BECOMES INEFFICIENT WHEN THERE ARE SIMILAR ERRORS BEING HANDLED THROUGHOUT AN APP, BUT FOR OUR PURPOSES IT IS JUST FINE.
 
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
