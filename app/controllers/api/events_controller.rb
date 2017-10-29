class API::EventsController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_filter :set_access_control_headers
    
    def set_access_control_headers
        # #1
        headers['Access-Control-Allow-Origin'] = '*'
        # #2
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        # #3
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end

    def create
        event_params
        @registered_application = Application.find_by(URL: request.env['HTTP_ORIGIN'])
        
        if @registered_application == nil
            render json: "Unregistered application", status: :unprocessable_entity
        end

        if @registered_application.save
            render json: @event, status: :created
            p "success!"
        else
            render json: {errors: @event.errors}, status: :unprocessable_entity
            p "no success!"
        end
    end


    def preflight
        head 200
    end

    private
    def event_params
        params.require(:event).permit(:name)
    end

end