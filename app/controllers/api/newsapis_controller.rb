module Api
    class NewsapisController < ApplicationController
        def index
            Time.zone = 'Asia/Manila'
            @news =  Newsapi.fetch()
            
            # render json: news[1]['title']

        end
    end
end