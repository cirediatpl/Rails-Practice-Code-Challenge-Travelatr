class DestinationsController < ApplicationController

    def show
        find_destination
    end

    private

    def find_destination
        @destination = Destination.find(params[:id])
    end

end