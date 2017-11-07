class API::EventsController < ApplicationController
            # #3
    skip_before_action :verify_authenticity_token, raise: false

    def create
        registered_application = Application.find_by(URL: request.env['HTTP_ORIGIN'])
            
        if registered_application == nil
            render json: "Unregistered application", status: :unprocessable_entity
        end
    end




    private
    def event_params
        params.require(:event).permit(:name)
    end

end
