class BloggersController < ApplicationController

    def show
        @blogger = Blogger.find(params[:id])
    end

    
end