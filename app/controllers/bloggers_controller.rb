class BloggersController < ApplicationController

    def show
        find_blogger
    end

    private

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

end