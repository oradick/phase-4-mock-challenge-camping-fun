class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json:activities, status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        # if activity.valid?
            activity = activity.destroy
        # else
        #     activity.errors.add({"error" => "Activity not found"})
        # end
    end
end
