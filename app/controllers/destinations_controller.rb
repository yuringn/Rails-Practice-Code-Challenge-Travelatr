class DestinationsController < ApplicationController

    def show
        @destination = Destination.find(params[:id])
        @most_popular = Destination.most_posted_about
    end

end