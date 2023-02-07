class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json:activities, status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        
        if activity
            activity = activity.destroy
        else
            render json: {error: "Activity not found"}, status: :not_found

            #OR
            # render_not_found
        end
    end

    private

    # def render_not_found
    # render json: {error: "Activity not found"}, status: :not_found
    # end
end
